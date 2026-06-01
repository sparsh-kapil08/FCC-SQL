#!/bin/bash
NUMBER=$(( RANDOM % 1000 + 1 ))
# echo $NUMBER # Comment this out before running FreeCodeCamp tests

echo "Enter your username:"
read USERNAME

PSQL="psql --username=freecodecamp --dbname=game -t --no-align -c"

# Fetch existing user details in one single, clean query to avoid database spam
USER_DATA=$($PSQL "SELECT games_played, best_game FROM GAME WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  # Insert new user with clean default zeros instead of NULL
  INSERT_USER_RESULT=$($PSQL "INSERT INTO GAME(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Parse the bar-separated values returned by psql
  GAMES_PLAYED=$(echo $USER_DATA | cut -d'|' -f1)
  BEST_GAME=$(echo $USER_DATA | cut -d'|' -f2)

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS

TRIES=0

CHECK() {
  # 1. Validate input FIRST before burning a turn
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read GUESS
    CHECK
    return
  fi

  # 2. Increment score only for legitimate integer guesses
  TRIES=$((TRIES + 1))

  if (( GUESS == NUMBER )); then
    echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
    
    # 3. Increment total games played by 1
    UPDATE_GAMES=$($PSQL "UPDATE GAME SET games_played = games_played + 1 WHERE username='$USERNAME'")
    
    # 4. Update high score if it is their first game OR if they beat their old record
    # (Checking if current record is 0 handles the brand new user scenario)
    CURRENT_RECORD=$($PSQL "SELECT best_game FROM GAME WHERE username='$USERNAME'")
    
    if (( CURRENT_RECORD == 0 || TRIES < CURRENT_RECORD )); then
      UPDATE_BEST=$($PSQL "UPDATE GAME SET best_game = $TRIES WHERE username='$USERNAME'")
    fi

  elif (( GUESS < NUMBER )); then
    echo "It's higher than that, guess again:"
    read GUESS
    CHECK
  else
    echo "It's lower than that, guess again:"
    read GUESS
    CHECK
  fi
}

CHECK

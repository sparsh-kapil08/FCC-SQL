#!/bin/bash

# Database connection command
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument was provided
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Query all required columns from the joined tables
# types.type comes from 'types', atomic_number/name/symbol from 'elements', mass/melt/boil from 'properties'
BASE_QUERY="SELECT atomic_number, name, symbol, types.type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id)"

# Filter dynamically based on input type (numeric vs string)
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_DATA=$($PSQL "$BASE_QUERY WHERE atomic_number = $1;")
else
  ELEMENT_DATA=$($PSQL "$BASE_QUERY WHERE symbol = '$1' OR name = '$1';")
fi

# Check if the database query returned any results
if [[ -z $ELEMENT_DATA ]]
then
  echo "I could not find that element in the database."
else
  # Read the pipe-delimited data into variables
  echo "$ELEMENT_DATA" | while IFS="|" read ATOMIC_NUM NAME SYMBOL TYPE MASS MELT BOIL
  do
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
fi

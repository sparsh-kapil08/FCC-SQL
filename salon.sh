#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
SERVICES=$($PSQL "SELECT SERVICE_ID,NAME FROM SERVICES;")
echo -e "~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
MENU(){
  echo "$SERVICES" | while IFS='|' read service_id name
  do
    echo "$service_id) $name"
  done
  read SERVICE_ID_SELECTED
  OUTPUT=$($PSQL "SELECT SERVICE_ID FROM SERVICES WHERE SERVICE_ID=$SERVICE_ID_SELECTED;")
  if [[ -z $OUTPUT ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MENU
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CHECK=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
    if [[ -z $CHECK ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      SERVICE=$($PSQL "SELECT name FROM SERVICES WHERE service_id=$SERVICE_ID_SELECTED")
      echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
      read SERVICE_TIME
      $PSQL "INSERT INTO CUSTOMERS(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');" > /dev/null 2>&1
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      $PSQL "INSERT INTO APPOINTMENTS(customer_id, time, service_id) VALUES($CUSTOMER_ID, '$SERVICE_TIME', $SERVICE_ID_SELECTED);" > /dev/null 2>&1
      echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      SERVICE=$($PSQL "SELECT name FROM SERVICES WHERE service_id=$SERVICE_ID_SELECTED")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      $PSQL "INSERT INTO APPOINTMENTS(customer_id, time, service_id) VALUES($CUSTOMER_ID, '$SERVICE_TIME', $SERVICE_ID_SELECTED);" > /dev/null 2>&1
      echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}
MENU

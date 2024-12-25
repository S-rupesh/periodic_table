#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [ $# -eq 0 ]; then
  echo "Please provide an element as an argument."
else
  FULL_DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) WHERE atomic_number = '$@' OR symbol = '$@' OR name = '$@';") 
  echo "$FULL_DATA" | sed 's/^[[:space:]]*//; s/[[:space:]]\+/ /g; s/[[:space:]]*$//' |while IFS="|" read A_NO NAME SYMBOL TYPE A_MASS M_P_C B_P_C
  do
    echo "The element with atomic number $A_NO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $A_MASS amu. $NAME has a melting point of $M_P_C celsius and a boiling point of $B_P_C celsius."
  done
   
fi
#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [ $# -eq 0 ]; then
  echo "Please provide and element as an argument"
else
  echo "working"  
fi
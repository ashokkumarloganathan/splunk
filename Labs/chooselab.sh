#!/bin/bash
echo "-----------------------"
echo "Choose the Lab to Start"
echo "1. Lab 1:"
echo "2. Lab 2:"
echo "3. Lab 3:"
echo "4. Lab 4:"
echo "5. Lab 5: Setting up Heavy Forwarder"
echo "-----------------------"

echo "Choose an Option:"
read option

case "$option" in
  "1")
    echo "Starting Lab 1."
    ;;
  "2")
    echo "Starting Lab 2."
    ./lab.sh
    ;;
  "3")
    echo "Starting Lab 3."
    ;;
  "4")
    echo "Starting Lab 4."
    ;;
  "5")
	  echo "Starting Lab 5."
  docker compose -f lab5.yml up -d
	;;
  *)
    echo "Check the options choosed."
    ;;
esac

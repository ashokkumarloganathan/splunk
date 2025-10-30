#!/bin/bash
echo "-----------------------"
echo "Choose the Lab to Start"
echo "1. Lab 1 - Configuring Universal Forwarder in Ubuntu:"
echo "2. Lab 2 - Configuring Splunk to Receive Syslogs:"
echo "3. Lab 3 - Setting Up Splunk Heavy Forwarder:"
echo "-----------------------"

echo "Choose an Option:"
read option

case "$option" in
  "1")
#    echo "Starting Lab 1."
    ./lab1.sh
    ;;
  "2")
#    echo "Starting Lab 2."
    ./lab2.sh
    ;;
  "3")
#    echo "Starting Lab 3."
    ./lab3.sh
    ;;
  "4")
    echo "Starting Lab 4."
    ;;
  "5")
	  echo "Starting Lab 5."
	;;
  *)
    echo "Check the options choosed."
    ;;
esac

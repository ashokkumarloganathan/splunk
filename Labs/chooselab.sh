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
    echo "Starting Lab 1."
    docker compose -f 'lab 1'.yml up -d
    ;;
  "2")
    echo "Starting Lab 2."
    docker start --container-name splunk -p8000:8000
    docker start dvwa
    ;;
  "3")
    echo "Starting Lab 3."
    docker start splunk
    docker start dvwa
    ;;
  "4")
    echo "Starting Lab 4."
    ;;
  "5")
	  echo "Starting Lab 5."
  docker compose -f 'lab 5'.yml up -d
	;;
  *)
    echo "Check the options choosed."
    ;;
esac

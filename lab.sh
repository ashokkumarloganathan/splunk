#!/bin/bash
echo "-----------------------"
echo "1. Start The Lab:"
echo "2. Check The Status:"
echo "3. Access DVWA CLI:"
echo "4. Access Splunk CLI:"
echo "5. Stop The Lab:"
echo "-----------------------"

echo "Choose an Option:"
read option

case "$option" in
  "1")
    echo "Starting The Lab."
    docker compose -f lab\ setup.yml up -d
    ;;
  "2")
    echo "Checking the Status."
    docker ps
    ./lab.sh
    ;;
  "3")
    echo "CLI Access to DVWA."
    docker exec -it dvwa /bin/bash
    ;;
  "4")
    echo "CLI Access to Splunk."
    docker exec -it splunk /bin/bash
    ;;
  "5")
    echo "Stoping Lab."
    docker compose -f lab\ setup.yml down
    ;;
  *)
    echo "Check the options choosed."
    ;;
esac

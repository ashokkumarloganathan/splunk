#!/bin/bash
echo "-----------------------"
echo "Welcome to Lab 3"
echo "This Lab focuses on Configuring Heavy Forwarder in Ubuntu"
echo "please use the menu below to navigate through the lab options"
echo "-----------------------"
echo "1. Start The Lab:"
echo "2. Check The Status:"
echo "3. Access DVWA CLI:"
echo "4. Access Splunk CLI:"
echo "5. Access Splunk HF CLI:"
echo "6. Stop The Lab:"
echo "-----------------------"
echo "Choose an Option:"
read option

case "$option" in
  "1")
    echo "Starting The Lab."
    docker compose -f ./docker-compose-lab1.yml -f ./docker-compose-lab3.yml up -d
    countdown_seconds=120
    echo "Starting your lab in 120s..."

        # Loop while the countdown is greater than or equal to 0
        while [ $countdown_seconds -ge 0 ]; do
            # Print the remaining time, using \r to overwrite the previous line
            printf "Time remaining: %2d seconds\r" "$countdown_seconds"
            # Decrement the countdown
            ((countdown_seconds--))
            # Wait for 1 second
            sleep 1
        done

        # Clear the line and print a final message
        echo -e "\nYour Lab is Started Now!"
        echo "you can access your splunk instance at http://192.168.255.100:8000 and"
        echo "DVWA at http://192.168.255.101/dvwa" and
        echo "Splunk Heavy Forwarder at http://192.168.255.103"
        ./lab3.sh
    ;;
  "2")
    echo "Checking the Status."
    docker ps
    ./lab3.sh
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
    echo "CLI Access to Splunk HF."
    docker exec -it splunk-hf /bin/bash
    ;;  
  "6")
    echo "Stoping Lab."
    docker compose -f ./'docker-compose-lab1'.yml -f ./docker-compose-lab3.yml stop
    ;;
  *)
    echo "Check the options choosed."
    ;;
esac

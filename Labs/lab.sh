#!/bin/bash
echo "-----------------------"
echo "1. Go to Lab Menu:"
echo "-----------------------"

echo "Choose an Option:"
read option

case "$option" in
  "1")
    echo "Start The Lab."
    ./chooselab.sh
    ;;
  *)
    echo "Check the options choosed."
    ;;
esac

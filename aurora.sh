#!/bin/bash

# Change this path to your dir path where aurora.py is located
# Note that this script creates another file in the same dir with the city number variable
cd ~/.config/waybar/scripts/aurora

# Get the city name variable
FILE="aurora_var"
if [ -f "$FILE" ]; then 
    source $FILE 
fi
# Create the variable if it doesn't exist
if [ -z "$city" ]; then
    city=0
fi

# Change the city number
if [ -n "$1" ]; then
    if [ "$1" = "-u" ]; then
        ((++city))
    elif [ "$1" = "-d" ]; then
        ((--city))
    fi
else
# Execute the python script
    python "aurora.py" $city
fi    

# Change the variable if it is out of bound
# The upper limit is hardcoded so if the number of cities changes, this number needs to be updated as well
if [ "$city" -gt 10 ]; then
    city=10
elif [ "$city" -lt 0 ]; then
    city=0
fi

# Save the var in a file
echo "city=$city" > ./aurora_var

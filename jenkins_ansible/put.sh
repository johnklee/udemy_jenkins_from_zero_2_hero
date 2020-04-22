#!/bin/sh
let counter=0
while [ $counter -lt 3 ]; do
    let counter=counter+1
    first_name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
    last_name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
    age=$(shuf -i 20-30 -n 1)
    echo "counter=$counter: first name=$first_name; last name=$last_name; age=$age"

    # mysql -u root -p1234 people -e "INSERT INTO register VALUES ($counter, '$first_name', '$last_name', $age)"
done

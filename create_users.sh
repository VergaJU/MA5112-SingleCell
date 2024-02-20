#!/bin/bash

# File containing usernames and passwords
user_file="ids.txt"

# Directory base path
base_directory="/home"

# Check if the file exists
if [ ! -f "$user_file" ]; then
    echo "Error: User file '$user_file' not found."
    exit 1
fi

# Loop through the lines in the file and create users with passwords and directories
while read -r username password email; do
    # Create user
    sudo useradd -m -s /bin/bash $username
    
    # Set password
    echo "$username:$password" | sudo chpasswd

    # Create user directory
    user_directory="$base_directory/$username"
    sudo mkdir -p "$user_directory"
    
    # copy practical file in user directory
    sudo cp practical.Rmd "$user_directory"
    sudo sed -i "s/\[email\]/\[$email\]/g" $user_directory/practical.Rmd
    sudo sed -i "s/Plasma//g" $user_directory/practical.Rmd

    # Set directory permissions
    sudo chown $username:$username "$user_directory"
    sudo chmod 700 "$user_directory"

    

done < "$user_file"

echo "Users, directories, and passwords set successfully."




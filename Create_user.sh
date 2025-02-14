#!/bin/bash

# Asking for the username
echo "Enter Your Name: "
read  username


# Checking if username already exists
if id "$username" &>/dev/null; then
    echo "User $username already exists"
    exit 1
fi

#Asking for the password
echo "Enter Your Password: "
read -s userpass

echo "Enter Your Password again: "
read -s userpass_again


# Check if password matches then create a new user and set the password
if [ "$userpass" != "$userpass_again" ]; then
    echo "Passwords do not match. Exiting..."
    exit 1
  
  else
  echo "Passwords match. Creating user $username..."
  useradd "$username" -m  -s /bin/bash
  echo "$username:$userpass" | passwd
  echo "User $username has been created successfully!"
fi


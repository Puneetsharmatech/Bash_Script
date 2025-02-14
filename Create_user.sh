#!/bin/bash

echo "Enter Your Name: "
read  username

if id "$username" &>/dev/null; then
    echo "User $username already exists"
    exit 1
fi

echo "Enter Your Password: "
read -s userpass

echo "Enter Your Password again: "
read -s userpass_again



if [ "$userpass" != "$userpass_again" ]; then
    echo "Passwords do not match. Exiting..."
    exit 1
  
  else
  echo "Passwords match. Creating user $username..."
  useradd "$username" -m  -s /bin/bash
  echo "$username:$userpass" | passwd
  echo "User $username has been created successfully!"
fi


#!/bin/bash

set -e

### Collect user and password info

read -p 'Username: ' username
read -sp 'Password: ' password

if [ -z "${username}" ] || [ -z "${password}" ]; then
    echo
    echo "Username or Password can't be empty. Please, try again."
    exit 1
fi
echo



#########
# TO DO #
#########

### 1. Configure the ssh server with the given user and password.

# Do the config for user and password here ...

build_args=" --build-arg SSH_USER=$username --build-arg SSH_PASSWORD=$password"


### 2. Generate ssh keys for this user and allow them to login using the generated key

# Do the config for ssh keys here ...

echo "Generating ssh keys for user $username ..."
ssh-keygen -q -f $username -N ""
chmod 700 $username

build_args+=" --build-arg SSH_PUB_KEY_PATH=${username}.pub"

#########################
# INFO TEXT TO THE USER #
#########################

docker build -t ssh-image . $build_args

docker rm -fv ssh-container|| true

# Create the container to test the changes
docker run -d -p 22:22 -p 80:80 --name ssh-container ssh-image

#### Change the <> placeholders to point to actual values
ip=$(docker inspect --format '{{.NetworkSettings.IPAddress}}' ssh-container)
echo "The server is ready and accessible at $ip, with user $username and the password that you set".
echo "You can find your ssh private key at $PWD/$username"
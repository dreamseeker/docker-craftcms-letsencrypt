#!/bin/bash

# Check if .env file exists
if [ -e .env ]; then
    source .env
else
    echo "Please set up your .env file before starting your enviornment."
    exit 1
fi

# Make directory if it does not exist.
mkdir -p $APACHE_BASE_PATH

# Change Working directory
cd $APACHE_BASE_PATH

# Download the latest version of Craft 3
wget https://craftcms.com/latest-v3.zip

# Unzip latest-v3.zip
unzip latest-v3.zip

# Remove Zip
rm latest-v3.zip

# Modified .env
sed -i "" 's:SECURITY_KEY="":SECURITY_KEY="'${CRAFT_SECURITY_KEY}'":g' .env
sed -i "" 's:DB_SERVER="localhost":DB_SERVER="'$CONTAINER_BASE_NAME'-db":g' .env
sed -i "" 's:DB_USER="root":DB_USER="'$MYSQL_USER'":g' .env
sed -i "" 's:DB_PASSWORD="":DB_PASSWORD="'$MYSQL_PASSWORD'":g' .env
sed -i "" 's:DB_DATABASE="":DB_DATABASE="'$MYSQL_DATABASE'":g' .env
sed -i "" 's:DB_TABLE_PREFIX="":DB_TABLE_PREFIX="'${CRAFT_DB_TABLE_PREFIX}'":g' .env
sed -i "" 's:DB_PORT="":DB_PORT="'${CRAFT_MYSQL_PORT}'":g' .env

exit 0

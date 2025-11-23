#!/bin/bash

set -e

echo " Cleaning up any existing containers..."
docker-compose down -v --remove-orphans

echo " Building and starting all services..."
docker-compose up --build

# The script will stay running with the compose output
# To stop, press Ctrl+C

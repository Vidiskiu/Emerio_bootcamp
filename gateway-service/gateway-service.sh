#!/bin/sh
while ! nc -z registry-service 8761 ; do
    echo "Waiting for the Alor Registry Service"
    sleep 3
done
while ! nc -z customer-service 8080 ; do
    echo "Waiting for the Alor Customer Service"
    sleep 3
done
java -Djava.security.egd=file:/dev/./urandom -jar /gateway-service.jar

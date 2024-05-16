#!/bin/bash

echo "frontend connect test"
docker exec frontend curl -s http://frontend > /dev/null
if [ $? -eq 0 ]; then
    echo "successful"
else
    echo "failed"
fi

echo "backend connect test"
docker exec frontend curl -s http://backend:3000 > /dev/null
if [ $? -eq 0 ]; then
    echo "successful"
else
    echo "failed"
fi

echo "database connect test"
docker exec backend psql -h database -U postgres -c "SELECT 1" > /dev/null
if [ $? -eq 0 ]; then
    echo "successful"
else
    echo "failed"
fi
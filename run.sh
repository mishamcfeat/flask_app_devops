#!/bin/bash

# Step 1: Build the Docker image
docker build -t flask_app:latest .

# Step 2: Run the tests
docker run --rm -d -p 5000:5000 --name flask_app_test flask_app:latest
sleep 5
curl -s http://localhost:5000 | grep "Hello, World!" && echo "Tests passed" || echo "Tests failed"
docker stop flask_app_test

# Step 3: Deploy the Flask app
docker run -d -p 5000:5000 --name flask_app flask_app:latest
echo "Flask app deployed on http://localhost:5000"

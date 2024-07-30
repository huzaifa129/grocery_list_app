#!/bin/bash

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install requirements
pip install -r requirements.txt

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "FLASK_APP=run.py" > .env
    echo "FLASK_ENV=development" >> .env
    echo "SECRET_KEY=$(python3 -c 'import secrets; print(secrets.token_hex(16))')" >> .env
fi

# Run the application
python3 run.py
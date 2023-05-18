# Base Image
FROM python:3.9-slim

# Work directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy other project files
COPY . .
RUN pip install --upgrade pip
# Expose a port to Containers 
EXPOSE 8080

# Command to run on server
CMD  [ "python main.py", "runserver", "0.0.0.0:8000" ]


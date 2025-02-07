# Use Python 3.8 as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Install Git
RUN apt-get update && apt-get install -y git

ARG GIT_ACCESS_TOKEN

# Use the token to securely clone the private repository
RUN git clone https://${GIT_ACCESS_TOKEN}@github.com/Aayush99Sharma/chatapp.git /app

# Set the working directory to the Django project directory
WORKDIR /app/fundoo

# Install system dependencies
RUN apt-get install -y python3.8-dev default-libmysqlclient-dev gcc netcat-openbsd

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Explicitly install mysqlclient
RUN pip install --no-cache-dir mysqlclient

# Expose Django port
EXPOSE 8000

# Run migrations before starting the server using bash
CMD ["bash", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]

# Use Python 3.8 as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    git \
    python3.8-dev \
    default-libmysqlclient-dev \
    gcc \
    netcat-openbsd

# Clone private repository securely
ARG GIT_ACCESS_TOKEN
RUN git clone https://${GIT_ACCESS_TOKEN}@github.com/Aayush99Sharma/chatapp.git /app

# Set working directory to Django project
WORKDIR /app/fundoo

# Install Python dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt
RUN pip install --no-cache-dir mysqlclient

# Set environment variables for DB (Persistent inside the container)
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}

# Run migrations at build time (Skipping if DB is unavailable)
RUN python manage.py makemigrations && python manage.py migrate 

# Expose Django port
EXPOSE 8000

# Start Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

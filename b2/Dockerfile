# Use Python 3.8 as the base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    python3.8-dev \
    default-libmysqlclient-dev \
    libssl-dev \
    build-essential \
    gcc \
    netcat-openbsd \
 && rm -rf /var/lib/apt/lists/*

# Securely clone the repository (using ARG for GitHub token)
ARG GIT_ACCESS_TOKEN
RUN git clone --depth=1 https://${GIT_ACCESS_TOKEN}@github.com/Aayush99Sharma/chatapp.git /app

# Set working directory to Django project
WORKDIR /app/fundoo

# Create a virtual environment
RUN python -m venv venv

# Activate the virtual environment and install dependencies
RUN /bin/bash -c "source venv/bin/activate && pip install --no-cache-dir -r /app/requirements.txt"
RUN /bin/bash -c "source venv/bin/activate && pip install --no-cache-dir mysqlclient"

# Pass database credentials at build time
ARG DB_HOST
ARG DB_PORT
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Set environment variables inside the container
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_NAME=${DB_NAME}
ENV DB_USER=${DB_USER}
ENV DB_PASSWORD=${DB_PASSWORD}

# Run Django migrations at build time
RUN /bin/bash -c "source venv/bin/activate && python manage.py makemigrations && python manage.py migrate"

# Expose Django port
EXPOSE 8000

# Start Django server using the virtual environment
CMD ["/bin/bash", "-c", "source venv/bin/activate && python manage.py runserver 0.0.0.0:8000"]

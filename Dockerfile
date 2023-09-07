# Use the official Python 3.8 image as the base
FROM python:3.8

# Install Flask
RUN pip install Flask

# Create the /app directory
RUN mkdir -p /app

# Create the application directory
WORKDIR /app

# Copy the Python script and other files
COPY run.py .

ENV APP_DIRS="/Ruuter/private/v2 /Ruuter/public/v2 Ruuter/private/v1 /Ruuter/public/v1 /Resql /DataMapper /Liquibase /OpenSearch /OpenSearch2"
RUN mkdir -p $APP_DIRS

LABEL org.opencontainers.image.description Docker PRE-ALPHA image for Buerokratt-DSL

# Set the main command to run your application
CMD ["python", "run.py"]


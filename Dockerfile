# Use the official Python 3.8 image as the base
FROM python:3.8

# Install Flask
RUN pip install Flask

# Create the application directory
WORKDIR /app

# Copy the Python script and other files
COPY run.py .
# ...

# Create directories in the image before copying
RUN mkdir -p \
    /Ruuter/private/v2 /Ruuter/public/v2 /Ruuter/private/v1 /Ruuter/public/v1 /Resql /DataMapper /Liquibase /OpenSearch /OpenSearch2

# Copy files for each directory
COPY Ruuter/private/v2 /Ruuter/private/v2
COPY Ruuter/public/v2 /Ruuter/public/v2
COPY Ruuter/private/v1 /Ruuter/private/v1
COPY Ruuter/public/v1 /Ruuter/public/v1
COPY Resql /Resql
COPY DataMapper /DataMapper
COPY Liquibase /Liquibase
COPY OpenSearch /OpenSearch
COPY Opensearch /OpenSearch2

# Run the shell script to copy directories only if they exist
CMD ["python", "run.py"]

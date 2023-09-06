# Use the official Python 3.8 image as the base
FROM python:3.8

# Install Flask
RUN pip install Flask

# Create the application directory
WORKDIR /app

# Copy the Python script and other files
COPY run.py .

# Create a shell script for conditional copying
COPY copy_directories.sh /usr/local/bin/copy_directories.sh
RUN chmod +x /usr/local/bin/copy_directories.sh

# Define the directory structure
ENV APP_DIRS="/Ruuter/private/v2 /Ruuter/public/v2 /Ruuter/private/v1 /Ruuter/public/v1 /Resql /DataMapper /Liquibase /OpenSearch /OpenSearch2"
RUN mkdir -p $APP_DIRS

# Run the shell script to copy directories only if they exist
CMD ["copy_directories.sh"]

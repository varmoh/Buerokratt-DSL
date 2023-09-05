# Use the official Python 3.8 image as the base
FROM python:3.8

# Install Flask
RUN pip install Flask

# Create the application directory
WORKDIR /app

# Copy the Python script and other files
COPY run.py .

# Define the directory structure
ENV APP_DIRS="/Ruuter/private/v2 /Ruuter/public/v2 /Resql"
RUN mkdir -p $APP_DIRS
RUN mkdir -p $APP_DIRS/backoffice $APP_DIRS/analytics $APP_DIRS/services $APP_DIRS/training

# Copy files for each directory
COPY Ruuter/private/v2 /Ruuter/private/v2
COPY Ruuter/public/v2 /Ruuter/public/v2
COPY Resql /Resql
COPY Dmapper/v1 /Dmapper/v1
COPY Dmapper/v2 /Dmapper/v2

# Set the main command to run your application
CMD ["python", "run.py"]

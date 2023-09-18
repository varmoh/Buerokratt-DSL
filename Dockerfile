# Use the official Python 3.8 image as the base
FROM python:3.8

# Install Flask
RUN pip install Flask

# Create the /app directory
#RUN mkdir -p /app

# Create the application directory
WORKDIR /app

# Copy the Python script and other files
COPY run.py .

#ENV APP_DIRS="/Ruuter/private/v2 /Ruuter/public/v2 Ruuter/private/v1 /Ruuter/public/v1 /Resql /DataMapper /Liquibase /OpenSearch /OpenSearch2 /bot"
ENV APP_DIRS="/Ruuter /Resql /DataMapper /Liquibase /OpenSearch /OpenSearch2 /bot"
RUN mkdir -p $APP_DIRS

#COPY Ruuter/private/v2 /Ruuter/private/v2
COPY Ruuter /Ruuter
#COPY Ruuter/public/v2 /Ruuter/public/v2
#COPY Ruuter/private/v1 /Ruuter/private/v1
#COPY Ruuter/public/v1 /Ruuter/public/v1
COPY Resql /Resql
#COPY Dmapper/v1 /Dmapper/v1
#COPY Dmapper/v2 /Dmapper/v2
COPY DataMapper /DataMapper
COPY Liquibase /Liquibase
COPY OpenSearch /OpenSearch
COPY OpenSearch2 /OpenSearch2
COPY bot /bot

LABEL org.opencontainers.image.description Docker PRE-ALPHA image for Buerokratt-DSL

# Set the main command to run your application
CMD ["python", "run.py"]


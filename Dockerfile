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

# Copy files for multiple directories in a single COPY command
COPY Ruuter/private/v2 Ruuter/public/v2 Ruuter/private/v1 Ruuter/public/v1 Resql DataMapper/v1 DataMapper/v2 Liquibase OpenSearch Opensearch / 
COPY --from=builder /Ruuter/private/v2 /Ruuter/private/v2
COPY --from=builder /Ruuter/public/v2 /Ruuter/public/v2
COPY --from=builder /Ruuter/private/v1 /Ruuter/private/v1
COPY --from=builder /Ruuter/public/v1 /Ruuter/public/v1
COPY --from=builder /Resql /Resql
COPY --from=builder /DataMapper/v1 /DataMapper/v1
COPY --from=builder /DataMapper/v2 /DataMapper/v2
COPY --from=builder /Liquibase /Liquibase
COPY --from=builder /OpenSearch /OpenSearch
COPY --from=builder /Opensearch /Opensearch

# Set the main command to run your application
CMD ["python", "run.py"]

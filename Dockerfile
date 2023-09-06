# Use the official Python 3.8 image as the base
FROM python:3.8

# Install Flask
RUN pip install Flask

# Create the application directory
WORKDIR /app

# Copy the Python script and other files
COPY run.py .

LABEL org.opencontainers.image.description Docker PRE-ALPHA image for Buerokratt-DSL

# Set the main command to run your application
CMD ["python", "run.py"]


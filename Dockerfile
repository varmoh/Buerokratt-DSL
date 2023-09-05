# Use a base image
FROM alpine:3.18.3

# Create folder structure
RUN mkdir -p \
    /Ruuter/private/v2/backoffice \
    /Ruuter/private/v2/analytics \
    /Ruuter/private/v2/services \
    /Ruuter/private/v2/training \
    /Ruuter/public/v2/backoffice \
    /Ruuter/public/v2/analytics \
    /Ruuter/public/v2/services \
    /Ruuter/public/v2/training \
    /resql/backoffice \
    /resql/analytics \
    /resql/services \
    /resql/training \
    /dmapper/backoffice \
    /dmapper/analytics \
    /dmapper/services \
    /dmapper/training \
    /dmapper/v2/backoffice \
    /dmapper/v2/analytics \
    /dmapper/v2/services \
    /dmapper/v2/training \ 

# Copy files
COPY Ruuter/private/v2/backoffice /Ruuter/private/v2/backoffice
COPY Ruuter/private/v2/analytics /Ruuter/private/v2/analytics
COPY Ruuter/private/v2/services /Ruuter/private/v2/services
COPY Ruuter/private/v2/training /Ruuter/private/v2/training
COPY Ruuter/private/v2/backoffice /Ruuter/private/v2/backoffice
COPY Ruuter/private/v2/analytics /Ruuter/private/v2/analytics
COPY Ruuter/private/v2/services /Ruuter/private/v2/services
COPY Ruuter/private/v2/training /Ruuter/private/v2/training

# Set the default command
CMD ["tail", "-f", "/var/log/myapp.log"]


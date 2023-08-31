FROM alpine:3.18.3

# Create folder structure
RUN mkdir -p /Ruuter/private/v2/backoffice
RUN mkdir -p /Ruuter/private/v2/analytics
RUN mkdir -p /Ruuter/private/v2/backoffice
RUN mkdir -p /Ruuter/private/v2/services
RUN mkdir -p /Ruuter/private/v2/training


# Copy files
COPY Ruuter/private/v2/backoffice /Ruuter/private/v2/backoffice
COPY Ruuter/private/v2/analytics /Ruuter/private/v2/analytics
COPY Ruuter/private/v2/backoffice /Ruuter/private/v2/backoffice
COPY Ruuter/private/v2/services /Ruuter/private/v2/services
COPY Ruuter/private/v2/training /Ruuter/private/v2/training

CMD ["sh", "-c", "echo 'Enjoy the Ruuter' && wait"]

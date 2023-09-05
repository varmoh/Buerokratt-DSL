FROM python:3.8
RUN pip install Flask

COPY run.py /app/

WORKDIR /app

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
    /Resql/backoffice \
    /Resql/analytics \
    /Resql/services \
    /Resql/training \
    /Dmapper/v1/backoffice \
    /Dmapper/v1/analytics \
    /Dmapper/v1/services \
    /Dmapper/v1/training \
    /Dmapper/v2/backoffice \
    /Dmapper/v2/analytics \
    /Dmapper/v2/services \
    /Dmapper/v2/training
# Copy files
COPY Ruuter/ /Ruuter/private/v2/backoffice

CMD ["python", "run.py"]


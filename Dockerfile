FROM ubuntu

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
	python3-pip \
	python3-setuptools \
    && rm -rf /var/lib/apt/lists/*

COPY ./ ./UrlShortener
WORKDIR ./UrlShortener
RUN pip install wheel
RUN pip install -r ./requirements.txt

EXPOSE 8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

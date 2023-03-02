FROM golang:1.15.8-buster
WORKDIR /app
COPY . .

RUN /app/setup.sh

# Update PATH and include a GO bin
ENV PATH=$PATH:/usr/local/go/bin

CMD make lint; \
    make build; \
    make unit-tests; \
    make integration-tests; \
    make validate; \
    make package

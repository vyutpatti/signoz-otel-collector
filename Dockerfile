FROM golang:latest
WORKDIR /app
COPY . .
# copy the config file
COPY config/default-config.yaml /etc/otel/config.yaml
RUN make build

ENTRYPOINT ["./.build/linux-amd64/signoz-collector"]
CMD ["--config", "/etc/otel/config.yaml"]

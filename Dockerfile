FROM alpine:latest

# Install iodine
RUN apk add --no-cache iodine

# Expose the necessary port for DNS (53)
EXPOSE 53/udp

# Copy the entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

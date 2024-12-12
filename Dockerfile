# Dockerfile
FROM ubuntu:22.04

# Set working directory
WORKDIR /app


# Copy the curardian-cli file to the container
COPY validation-engine /app/
COPY guardian-cli-linux /app/

# Ensure the file is executable
RUN chmod +x guardian-cli-linux

# Set the default command for the container
CMD ["./guardian-cli-linux --restart=always -e LOOP_INTERVAL_MS=${LOOP_INTERVAL_MS} -e PRIVATE_KEY=${PRIVATE_KEY}"]
# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Copy the necessary files into the container
COPY . .

# Ensure the guardian-cli-linux binary is executable
RUN chmod +x guardian-cli-linux

# Install any necessary dependencies (if required by the binary)
RUN apt-get update && apt-get install -y libstdc++6 libgcc1 libc6
RUN ls "-la"
# Specify the default command for the container
CMD ["/bin/sh", "-c", "./guardian-cli-linux guardian run ${PRIVATE_KEY} --loop-interval-ms ${LOOP_INTERVAL_MS}"]
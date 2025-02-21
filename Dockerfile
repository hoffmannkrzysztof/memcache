# Use the official Memcached image as a base
FROM memcached:latest
USER root
# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install apt, wget, and perl
RUN apt-get update && \
    apt-get install -y wget perl && \
    rm -rf /var/lib/apt/lists/*

# Expose Memcached default port
EXPOSE 11211

USER memcache
# Start Memcached
CMD ["memcached", "-p 11211", "-u memcache", "-vv"]

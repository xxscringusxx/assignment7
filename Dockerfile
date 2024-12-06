FROM ubuntu:latest

# Create /structure directory with appropriate permissions
RUN mkdir -p /structure && chmod 777 /structure

# Ensure "sync" user and group exist, create "sync-work" file, and set permissions
RUN id -u sync || useradd -m sync && \
    touch /structure/sync-work && \
    chown sync:$(id -gn sync) /structure/sync-work

# Create "nobody-work" file and assign ownership to the nobody user
RUN touch /structure/nobody-work && \
    chown nobody:nogroup /structure/nobody-work

# Create a user with UID 5000
RUN id -u collin || useradd -u 5000 collin

# Use /bin/bash explicitly for the CMD
CMD ["/bin/bash", "-c", "while true; do echo users; sleep 1; done"]





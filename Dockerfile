From alpine
MAINTAINER abitnomadic <abitnomadic01@Cgmail.com>

ARG MUMBLE_VERSION=1.2.19
ENV MUMBLE_FILE=murmur-static_x86-${MUMBLE_VERSION}.tar.bz2
ARG MUMBLE_URL=https://github.com/mumble-voip/mumble/releases/download/${MUMBLE_VERSION}/${MUMBLE_FILE}


# Create Mumble directories
RUN mkdir -pv /opt/mumble

# Create non-root user
RUN adduser -DHs /sbin/nologin mumble

# Copy config file
# COPY files/murmur.ini /etc/mumble/murmur.ini

# Install dependencies, fetch Mumble bzip archive and chown files
RUN apk add --update ca-certificates bzip2 tar tzdata wget \
    && wget -q ${MUMBLE_URL} \
    && apk del ca-certificates wget && rm -rf /var/cache/apk/* \
    && chown -R mumble:mumble /opt/mumble

# Expose port
EXPOSE 64738

# Add the start script
ADD start.sh /tmp/start.sh
RUN chmod 755 /tmp/start.sh

# Set volumes
VOLUME /opt/mumble/data

# Entrypoint to extract mumble if not on server
ENTRYPOINT ["/tmp/start.sh"]

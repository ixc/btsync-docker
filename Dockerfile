FROM interaction/base:latest

# Sync a single standard folder, given a secret key.

# Btsync.
ENV BTSYNC_VERSION=2.3.3
RUN wget -O - "https://download-cdn.getsync.com/${BTSYNC_VERSION}/linux-x64/BitTorrent-Sync_x64.tar.gz" | tar -xz -C /usr/local/bin -f - btsync

# Environment.
ARG PROJECT_NAME
ENV PROJECT_NAME=$PROJECT_NAME
ENV PROJECT_DIR=/opt/$PROJECT_NAME
ENV PATH=$PROJECT_DIR/bin:$PATH
WORKDIR $PROJECT_DIR

# Entrypoint.
ENTRYPOINT ["entrypoint-base.sh", "entrypoint-btsync.sh"]
CMD ['btsync.sh']

# Source.
COPY . $PROJECT_DIR

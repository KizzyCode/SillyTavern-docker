FROM ghcr.io/sillytavern/sillytavern:latest

# Create user and set permissions for rootless environment
RUN adduser --system --disabled-password --no-create-home --uid 10000 --shell /bin/sh sillytavern
RUN chown -R sillytavern ./
USER sillytavern

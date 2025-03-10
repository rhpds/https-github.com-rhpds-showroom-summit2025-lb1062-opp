#!/usr/bin/env bash

# Detect if docker is installed, default to docker if both are present
if command -v docker &> /dev/null; then
  CONTAINER_CMD="docker"
elif command -v podman &> /dev/null; then
  CONTAINER_CMD="podman"
else
  echo "Neither podman nor docker found. Please install one of them."
  exit 1
fi

# Case statement to handle start, stop, and restart actions
case "$1" in
  start)
    echo "Starting serve process..."
    $CONTAINER_CMD run -d --rm --name showroom-httpd -p 8080:8080 \
      -v "./www:/var/www/html/:z" \
      registry.access.redhat.com/ubi9/httpd-24:1-301
    echo "Serving lab content on http://localhost:8080/index.html"
    ;;
  stop)
    echo "Stopping the container..."
    $CONTAINER_CMD stop showroom-httpd
    echo "Container stopped."
    ;;
  restart)
    echo "Restarting the container..."
    $CONTAINER_CMD restart showroom-httpd
    echo "Container restarted."
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
    ;;
esac


# use a node base image
FROM node:19-bullseye

# set maintainer
LABEL maintainer="joeybader2003@outlook.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
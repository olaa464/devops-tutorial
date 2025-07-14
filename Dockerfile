# use a node base image
FROM node:18

# set maintainer
LABEL maintainer "miiro@getintodevops.com"

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# tell docker what port to expose
EXPOSE 8000

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

CMD ["npm", "start"]

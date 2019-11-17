FROM node:12.13.0-alpine

RUN apk update && apk upgrade && \
  apk -Uuv add --no-cache make g++ git python py-pip jq openssh curl

CMD ["node"]
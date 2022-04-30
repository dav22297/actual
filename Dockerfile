FROM node:lts-alpine3.15 as builder
#RUN apk add git nodejs yarn build-base python3-dev py3-bcrypt
RUN apk add git nodejs yarn g++ gcc libgcc libstdc++ linux-headers make python3
RUN git clone https://github.com/actualbudget/actual-server.git
WORKDIR /actual-server
ENV NODE_ENV=production
RUN yarn install --production


FROM alpine:latest
COPY --from=builder /actual-server /usr/bin/actual-server
RUN apk --no-cache add nodejs yarn

ENV NODE_ENV=production
WORKDIR /usr/bin/actual-server

RUN mkdir ./server-files
RUN mkdir ./user-files

ENTRYPOINT ["yarn", "start"]
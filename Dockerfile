# docker build --no-cache -t es .
# docker run -v $PWD:/app -p 8080:8080 -i es

FROM node:boron

RUN mkdir /app
WORKDIR /app

COPY . /app
RUN npm install && npm run docs

EXPOSE 8080

ENV PATH=$PATH:/app/node_modules/.bin
CMD webpack-dev-server  --config webpack.config.js --host=0.0.0.0

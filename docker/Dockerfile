FROM google/nodejs

WORKDIR /app

EXPOSE 3000

RUN npm install -g bower
RUN npm install -g gulp

ADD package.json /app/
RUN npm install

ADD bower.json /app/
RUN bower install --allow-root --config.interactive=false

ADD . /app/

ENTRYPOINT ["gulp", "serve"]

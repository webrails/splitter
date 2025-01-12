FROM node:18.18.2-alpine AS node
FROM ruby:3.3.4-alpine3.20

RUN apk update && apk add postgresql16-client libpq-dev git gcompat tzdata vips vips-heif build-base geos bash vim

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

RUN mkdir /usr/src/app
WORKDIR /usr/src/app
ENV PATH=/usr/src/app/bin:$PATH

RUN bash -lc 'echo "IRB.conf[:USE_AUTOCOMPLETE] = false" > ~/.irbrc'

COPY ./Gemfile* .

RUN npm install --global yarn --force && bundle install

CMD ["bin/dev"]

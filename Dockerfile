FROM ruby:2.3.8-alpine3.8

RUN apk add --update nodejs g++ make git

WORKDIR /usr/src/app

RUN git clone https://github.com/lord/slate .

RUN bundle install

RUN rm -rf /usr/src/app/source/index.html.md

ADD ./build.sh /
RUN chmod +x /build.sh

ENTRYPOINT ["/build.sh"]

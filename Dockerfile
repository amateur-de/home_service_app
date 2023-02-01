FROM ruby:2.7.2-alpine
RUN mkdir /home/app
WORKDIR /home/app
COPY ./ ./
RUN apk add --no-cache build-base nodejs tzdata postgresql-client postgresql-dev
RUN bundle install
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
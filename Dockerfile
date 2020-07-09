 
FROM ruby:2.7.1-alpine
ENV LANG C.UTF-8

RUN apk update && \
    apk add  nodejs  git vim libxml2-dev  bash libxslt-dev  build-base sqlite-dev curl-dev yaml-dev zlib-dev nodejs yarn mariadb-dev mysql-client tzdata && \
    rm -rf /var/lib/apt/lists/*

#Cache bundle install
RUN mkdir /myapp
WORKDIR /myapp
COPY ./Gemfile* /myapp/
RUN bundle install 
COPY . /myapp
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE  3000
ARG development
ENV RACK_ENV=development
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
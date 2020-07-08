 
FROM ruby:2.7.1
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y nodejs \
                       vim \
                        libxml2-dev \
                        libxslt-dev \
                       mysql-client-* \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
ADD dump.sql /tmp/dump.sql
ADD init_db.sh /tmp/init_db.sh
RUN bundle install
RUN bundle config build.nokogiri --use-system-libraries
ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN chmod +x /tmp/init_db.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0'
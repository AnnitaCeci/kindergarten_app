 
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
RUN mkdir /myapp
WORKDIR /myapp
COPY ./Gemfile /myapp/Gemfile
COPY ./Gemfile.lock /myapp/Gemfile.lock
RUN bundle install 
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0'
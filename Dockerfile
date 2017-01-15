FROM ruby:2.3.3

RUN apt-get --quiet update && apt-get --quiet --yes install nodejs && rm -rf /var/lib/apt/lists/*

ENV SOURCE_DIR /srv/core_connection

WORKDIR $SOURCE_DIR

COPY Gemfile Gemfile.lock ${SOURCE_DIR}/

RUN bundle install

COPY . ${SOURCE_DIR}/

RUN useradd -m core_connection_user
USER core_connection_user

CMD bundle exec puma -C config/puma.rb

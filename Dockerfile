FROM ruby:2.6

ENV APP_HOME /usr/src/app
WORKDIR $APP_HOME
COPY Gemfile* ./
RUN gem install bundler
RUN bundle install

ADD . $APP_HOME

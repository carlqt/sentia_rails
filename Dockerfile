FROM ruby:3.2.2

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler
RUN bundle install

COPY . .

RUN rails db:create
RUN rails db:migrate


CMD ["rails", "s", "-b", "0.0.0.0"]
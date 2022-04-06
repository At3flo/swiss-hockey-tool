FROM ruby:2.7.5-alpine3.14
# Be sure to use nodejs <= v14

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES=true
# For debugging only
#ENV RAILS_LOG_TO_STDOUT=true

WORKDIR /app
RUN apk update && apk --no-cache upgrade && apk add --no-cache nodejs yarn postgresql-client postgresql-dev tzdata build-base

COPY . /app

# Install gems
RUN bundle config set without 'development test' && bundle install

# Install npm packages
RUN yarn install

# Compile assets
RUN bundle exec rails assets:precompile

EXPOSE 3000

# Start the main process.
WORKDIR /app
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
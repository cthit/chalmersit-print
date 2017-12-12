FROM ruby:2.4.2

RUN apt-get update && \
  apt-get install -y net-tools

# Set locale
ENV LANG C.UTF-8

# Install gems
RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

# Upload source
COPY . /app


RUN useradd ruby
RUN chown -R ruby /app
USER ruby

# Start server
ENV PORT 3000
EXPOSE 3000
CMD ["rails", "s", "-b", "0.0.0.0"]


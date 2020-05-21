FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /golf_search01
WORKDIR /golf_search01
COPY Gemfile /golf_search01/Gemfile
COPY Gemfile.lock /golf_search01/Gemfile.lock
RUN bundle install
COPY . /golf_search01

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
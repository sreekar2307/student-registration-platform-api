FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile Gemfile.lock ./
ARG environment=development
RUN if [[ "$environment" == "development" ]] ; then bundle install --quiet --jobs 20 --retry 5 ; else bundle install --quiet --jobs 20 --retry 5 --without development test ; fi
EXPOSE 3000
COPY . ./
RUN mv entrypoint.sh /usr/bin/entrypoint.sh && chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
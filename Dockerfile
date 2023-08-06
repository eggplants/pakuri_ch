FROM ruby:3.2.2

RUN apt-get update \
  && apt-get install -y nodejs npm \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN npm install yarn
RUN yarn install --network-timeout 600000

WORKDIR /app
COPY Gemfile /app/Gemfile

COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

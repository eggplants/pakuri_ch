FROM ruby:3.2.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && curl -fsSL https://deb.nodesource.com/setup_18.x | bash \
  && apt-get install -y nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \

RUN npm install --global yarn
RUN yarn install --network-timeout 600000

WORKDIR /app
COPY Gemfile /app/Gemfile

COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

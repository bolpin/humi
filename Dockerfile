#Base image
FROM ruby:2.7.0

# Setup environment variables that will be available to the instance
ENV APP_HOME /humi

# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
      # Needed for certain gems
    build-essential \
         # Needed for postgres gem
    libpq-dev \
         # Needed for asset compilation
    nodejs \
    yarn \
    curl \
    software-properties-common \
    # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

RUN mkdir /build
WORKDIR /build
RUN curl https://www.npmjs.org/install.sh | sh

# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add our Gemfile
# and install gems

ADD Gemfile* $APP_HOME/
RUN bundle install

# Copy over our application code
ADD . $APP_HOME

RUN yarn

# Run our app
CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'

# Use Ruby as the base image
FROM ruby:3.0.2 as build

# Install necessary packages
RUN apt-get update && apt-get install -y curl unzip wget

# Install system dependencies

RUN apt-get update && \
    apt-get install -y wget unzip

# Download and install Chrome

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

RUN mkdir driver

# # Download and install ChromeDriver

# RUN LATEST_VERSION=$(wget -qO- https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \

RUN wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/116.0.5845.110/linux64/chromedriver-linux64.zip  &&\
    unzip chromedriver-linux64.zip  && \
    mv chromedriver-linux64/chromedriver ./driver/chromedriver && \
    chmod +x ./driver/chromedriver

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler && bundle install

COPY . /app

FROM build as test

CMD ["ruby" , "test_main.rb"]

FROM build as production

CMD ["ruby","production.rb"]
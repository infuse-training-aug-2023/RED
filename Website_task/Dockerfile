# Use the latest Ruby image as the base
FROM ruby:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl wget unzip gnupg2 && \
    apt-get clean

# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb || apt-get -f install -y && \
    rm google-chrome-stable_current_amd64.deb

# Download ChromeDriver and place it in /usr/local/bin/
RUN LATEST_CHROMEDRIVER=$(curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    curl -sSL https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/116.0.5845.96/linux64/chrome-linux64.zip -o chromedriver.zip && \
    unzip chromedriver.zip && \
    rm chromedriver.zip && \
    mv chromedriver /usr/local/bin/

# Set an environment variable to suppress unnecessary logs from Chrome
ENV CHROME_LOG_FILE=/dev/null

# Set working directory
WORKDIR /app


# Copy Gemfile and Gemfile.lock for installing Ruby gems
COPY Gemfile Gemfile.lock /app/

# Install Ruby gems
RUN gem install bundler && bundle install

# Copy all project files to the container
COPY . /app/

# Command to run your test script (replace with your actual command)
CMD ["ruby", "test_script.rb"]

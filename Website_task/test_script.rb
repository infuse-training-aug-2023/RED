require 'selenium-webdriver'

# Create a new instance of the Chrome WebDriver
driver = Selenium::WebDriver.for :chrome

# Navigate to a URL
driver.get('https://www.google.com')

# Wait for a few seconds to observe the opened browser
sleep(5)

# Close the browser
driver.quit

# mainDriver

require 'selenium-webdriver'

class MainDriver
  attr_reader :driver
  
  def initialize(browser: :chrome)
    Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
    @driver = Selenium::WebDriver.for browser
  end

  def maximize_window
    @driver.manage.window.maximize
  end

  def visit(url)
    @driver.get url
  end

  def find_element(how, what)
    @driver.find_element(how, what)
  end

  def click(element)
    element.click
  end

  def input_text(element, text)
    element.send_keys(text)
  end

  def get_text(element)
    element.text
  end

  def close
    @driver.quit
  end
end
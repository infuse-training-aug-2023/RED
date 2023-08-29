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

  def find_element(type, value)
    @driver.find_element(type, value)
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

  # implicit wait
  def set_implicit_wait(seconds = 10)
    @driver.manage.timeouts.implicit_wait = seconds
  end

  # explicit wait
  def wait_for_element(selector, value, timeout = 10)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.find_element(how, what) }
  end

  def close
    @driver.quit
  end
end
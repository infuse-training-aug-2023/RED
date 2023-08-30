# mainDriver
require 'selenium-webdriver'


class MainDriver
  attr_reader :driver
  def initialize(driver)
    @driver = driver
  end

  def maximize_window
    @driver.manage.window.maximize
  end

  def visit(url)
    @driver.get(url)
  end
  
  def get_text(element)
    element.text
  end

  def sleep
    sleep 5
  end

  def close
    @driver.quit
  end
end

class MouseEvent
  attr_reader :driver

  def initialize(driver)
    @driver = driver
  end
   
  def click(element)
    element.click
    end
end

class KeyboardEvents
    def initialize(driver)
        @driver = driver
    end
    
    def input_text(element, text)
        element.send_keys(text)
    end

    def enter_key(element)
        element.send_keys(:return)
    end
end

# Web finders 

class WebFinder
  def initialize(driver)
    @driver = driver
  end
  def find_element(type, value)
    @driver.find_element(type, value)
  end

  def find_elements(type, value)
    @driver.find_elements(type, value)
  end

  # implicit wait
  def set_implicit_wait(seconds = 10)
    @driver.manage.timeouts.implicit_wait = seconds
  end

  # explicit wait
  def wait_for_element(selector, value, timeout = 10)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { @driver.find_element(selector, value) }
  end

    # Scroll to
    def scroll_down(amount)
        @driver.execute_script("window.scrollBy(0, #{amount});")
    end

    def scroll_to_element(element)
      @driver.execute_script('arguments[0].scrollIntoView(false);', element)
    end


end
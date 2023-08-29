require 'test/unit'
require 'selenium-webdriver'
require_relative '../MainClass'
require_relative '../WebDriver'


$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)

main_driver = MainDriver.new($d)
mouse_event = MouseEvent.new($d)

class TestMouseEvent < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @mouse_event = MouseEvent.new(@driver)
  end

  def teardown
    @driver.quit
  end

  def test_click_element
    @driver.get('https://letcode.in/forms')
    element = @driver.find_element(:id, 'firstname')
    @mouse_event.click(element)
    
    assert_not_nil(element.text, "Element text is nil after clicking")
  end
  
end

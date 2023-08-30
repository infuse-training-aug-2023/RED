require 'test/unit'
require_relative 'MainClass'  # Adjust the path accordingly
require_relative 'WebDriver'   # Adjust the path accordingly
require 'selenium-webdriver'

class TestMainDriver < Test::Unit::TestCase
  def setup
    @driver = Driver.new(browser: :chrome).instance_variable_get(:@driver)
    @main_driver = MainDriver.new(@driver)
  end

  def test_maximize_window
    initial_size = @driver.manage.window.size

    @main_driver.maximize_window
    maximized_size = @driver.manage.window.size
    assert_true(maximized_size.width > initial_size.width)
    assert_true(maximized_size.height > initial_size.height)
  end

  def test_visit
    url = 'https://letcode.in/forms'
    @main_driver.visit(url)
    assert_equal(url, @driver.current_url)
  end

   def test_get_text
    url = 'https://letcode.in/forms'
    @driver.get(url)
    element = @driver.find_element(:tag_name,'h1')

    assert_equal('Form', @main_driver.get_text(element))
  end



end


class TestKeyboardEvents < Test::Unit::TestCase


  def setup
    @driver = Driver.new(browser: :chrome).instance_variable_get(:@driver)
    @keyboard_events = KeyboardEvents.new(@driver)
  end

   def test_input_text
    # Open a test page
    @driver.get('https://letcode.in/forms')

    # Find a text input element
    element = @driver.find_element(id: 'firstname')

    text = 'Hello, World!'
    @keyboard_events.input_text(element, text)

    assert_equal(text, text_input.attribute('value'))
  end

  # def test_enter_key
  #   dummy_element = DummyElement.new
  #   @keyboard_events.enter_key(dummy_element)

  #   assert_equal(:return, dummy_element.keys_sent)
  # end
end

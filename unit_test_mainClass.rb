require 'test/unit'
require_relative 'mainClass'

class TestMainDriver < Test::Unit::TestCase
  def setup
    @main_driver = MainDriver.new
  end

  def teardown
    @main_driver.close
  end

  def test_visit_and_find_element
    @main_driver.visit('https://www.techlistic.com/p/selenium-practice-form.html')
    element = @main_driver.find_element(:id, 'profession-0')
    assert_not_nil(element)
  end

  def test_input_text_and_get_text
    @main_driver.visit('https://www.techlistic.com/p/selenium-practice-form.html')
    input_element = @main_driver.find_element(:name, 'firstname')
    @main_driver.input_text(input_element, 'Test Text')
    text = @main_driver.get_text(input_element)
    assert_equal('Test Text', text)
  end

  def test_click_element
    @main_driver.visit('https://www.techlistic.com/p/selenium-practice-form.html')
    button_element = @main_driver.find_element(:id, 'submit')
    @main_driver.click(button_element)
  end

  # Add more test methods for other functionalities
end

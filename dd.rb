require 'test/unit'
require 'selenium-webdriver'
require_relative '../MainClass'
require_relative '../WebDriver'

$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)
web_finder = WebFinder.new($d)
main_driver = MainDriver.new($d)

class TestWebFinder < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for :chrome
    @web_finder = WebFinder.new(@driver)
  end

  def teardown
    $d.quit
  end

  def test_find_element
    @driver.get('https://letcode.in/forms')
    result = @web_finder.find_element(:id, 'firstname')
    assert_not_nil(result, "Element not found")
  end

  def test_find_elements
    @driver.get('https://letcode.in/forms')
    result = @web_finder.find_elements(:tag_name, 'input')
    assert_not_empty(result, "No elements found")
  end

  def test_set_implicit_wait
    @web_finder.set_implicit_wait(10)
    assert_equal(10, @driver.manage.timeouts.implicit_wait)
  end

  def test_wait_for_element
    @driver.get('https://letcode.in/forms')
    @web_finder.wait_for_element(:id, 'firstname', 10)
    assert_not_nil(@driver.find_element(:id, 'firstname'), "Element not found after waiting")
  end

  def test_scroll_down
    @driver.get('https://letcode.in/forms')
    initial_scroll_position = @driver.execute_script('return window.pageYOffset;')
    @web_finder.scroll_down(100)
    new_scroll_position = @driver.execute_script('return window.pageYOffset;')
    assert_equal(initial_scroll_position + 100, new_scroll_position)
  end
end

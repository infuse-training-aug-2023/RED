require 'test/unit'
require 'selenium-webdriver'
require_relative 'MainClass'
require_relative 'WebDriver'

$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)
$d.manage.window.resize_to(1920,1080)

class TestMouseEvent < Test::Unit::TestCase
    def setup
      @driver = Driver.new(browser: :chrome).instance_variable_get(:@driver)
      @mouse_event = MouseEvent.new(@driver)

    end
  
    def teardown
      $d.quit
    end
  
    def test_click_element
      @driver.get('https://letcode.in/forms')
      puts "Testing MouseEvent : Click"
      element = @driver.find_element(:id, 'firstname')
      @mouse_event.click(element)
      assert_not_nil(element.text, "Element text is nil after clicking")
    end
end


class TestWebFinder < Test::Unit::TestCase
    def setup
      @driver = Driver.new(browser: :chrome).instance_variable_get(:@driver)
      @web_finder = WebFinder.new(@driver)
    end
  
    def teardown
      $d.quit
    end
  
    def test_find_element
      @driver.get('https://letcode.in/forms')
      puts "Testing WebFinder : find_element"
      result = @web_finder.find_element(:id, 'firstname')
      assert_not_nil(result, "Element not found")
    end
  
    def test_find_elements
      @driver.get('https://letcode.in/forms')
      puts "Testing Webfinder : find_elements"
      result = @web_finder.find_elements(:tag_name, 'input')
      assert_not_empty(result, "No elements found")
    end
  
    def test_set_implicit_wait
      @web_finder.set_implicit_wait(10)
      puts "Testing Implicit wait"
      assert_equal(10, @driver.manage.timeouts.implicit_wait)
    end
 
  
    def test_wait_for_element
      @driver.get('https://letcode.in/forms')
      puts "Tesing WebFinder : wait_for_element"
      @web_finder.wait_for_element(:id, 'firstname', 10)
      assert_not_nil(@driver.find_element(:id, 'firstname'), "Element not found after waiting")
    end

  
    def test_scroll_to_element
      @driver.get('https://letcode.in/forms')
      puts "Testing WebFinder : Scroll_to_element"
      element_to_scroll_to = @driver.find_element(:xpath, "/html/body/app-root/app-footer/footer/div[1]/p/a[1]")  # Replace 'element_id' with the actual ID of the element
      @driver.execute_script('arguments[0].scrollIntoView();', element_to_scroll_to)
      new_scroll_position = @driver.execute_script('return window.pageYOffset;')
      assert(new_scroll_position > 0, "Scroll position should be greater than 0")
    end

end


class TestMainDriver < Test::Unit::TestCase
  def setup
    @driver = Driver.new(browser: :chrome).instance_variable_get(:@driver)
    @main_driver = MainDriver.new(@driver)
  end

  def teardown
      $d.quit
  end

  def test_visit
    url = 'https://letcode.in/forms'
    puts "Tesing Navigate to url : visit()"
    @main_driver.visit(url)
    assert_equal(url, @driver.current_url)
  end

   def test_get_text
    url = 'https://letcode.in/forms'
    puts "Testing Navigate to url : get()"
    @driver.get(url)
    element = @driver.find_element(:tag_name,'h1')

    assert_equal('Form', @main_driver.get_text(element))
  end

end


class TestKeyboardEvents < Test::Unit::TestCase


  def setup
    @driver = Driver.new(browser: :chrome).instance_variable_get(:@driver)
    @keyboard_events = KeyboardEvents.new(@driver)
    @webfinder = WebFinder.new(@driver)
    @mouse_event = MouseEvent.new(@driver)
    @main_driver = MainDriver.new(@driver)
  end

   class DummyElement
    attr_reader :keys_sent

    def send_keys(keys)
      @keys_sent = keys
    end
  end

  def teardown
    $d.quit
  end

  def test_send_keys_to_input_field
    text = "Anup"
    puts "Testing KeyboardEvent : Send Keys"
    url = 'https://letcode.in/forms'
    @main_driver.visit(url)
    firstname = @webfinder.find_element(:id, 'firstname')
    @keyboard_events.input_text(firstname, text)
    actual_output = firstname.attribute('value')
    assert_equal(text, actual_output)
  end


  def test_enter_key
    dummy_element = DummyElement.new
    puts "Testing for Enter key event : send_keys"
    @keyboard_events.enter_key(dummy_element)

    assert_equal(:return, dummy_element.keys_sent)
  end
end
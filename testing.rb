require 'test/unit'
require_relative 'MainClass'  # Adjust the path accordingly
require_relative 'WebDriver'   # Adjust the path accordingly

class TestMainDriver < Test::Unit::TestCase
  class DummyDriver
    def manage
      self
    end

    def window
      self
    end

    def maximize
      true
    end

    def get(url)
      @visited_url = url
    end

    def visited_url
      @visited_url
    end

    def quit
      @quit_called = true
    end

    def quit_called?
      @quit_called
    end

    # Simulate element for testing get_text
    class DummyElement
      def text
        'Sample Text'
      end
    end

  end

  def setup
    @driver = DummyDriver.new
    @main_driver = MainDriver.new(@driver)
  end

  def test_maximize_window
    assert_true(@main_driver.maximize_window)
  end

  def test_visit
    url = 'https://www.techlistic.com/p/selenium-practice-form.html#google_vignette'
    @main_driver.visit(url)

    assert_equal(url, @driver.visited_url)
  end

  def test_get_text
    element = DummyDriver::DummyElement.new
    assert_equal('Sample Text', @main_driver.get_text(element))
  end

  def test_close
    # @main_driver = MainDriver.new
    @main_driver.close
    assert_true(@driver.quit_called?)
  end

end

class TestKeyboardEvents < Test::Unit::TestCase
  class DummyElement
    attr_reader :keys_sent

    def send_keys(keys)
      @keys_sent = keys
    end
  end

  def setup
    @keyboard_events = KeyboardEvents.new(nil)  # Passing nil to avoid actual interactions
  end

  def test_input_text
    element = DummyElement.new
    text = 'Hello, World!'
    @keyboard_events.input_text(element, text)

    assert_equal(text, element.keys_sent)
  end

  def test_enter_key
    element = DummyElement.new
    @keyboard_events.enter_key(element)

    assert_equal(:return, element.keys_sent)
  end
end

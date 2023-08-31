require 'selenium-webdriver'
require_relative '../MainClass'
require_relative '../WebDriver'

class ProductDetailsFlow
  def initialize(driver)
    @driver = driver
    @driver.manage.window.resize_to(1920,1080)
    @web_finder = WebFinder.new(@driver)
    @mouse_event = MouseEvent.new(@driver)
    @keyboard_events = KeyboardEvents.new(@driver)
  end

  def run
    begin
      puts "------------ Get selected product details -------------------------------------->"
      visit('https://www.skullcandy.in')
      puts "Visited the website"

      search_button = @web_finder.find_element(:id, 'menu-item-24420076')
      @mouse_event.click(search_button)

      search_bar = @web_finder.find_element(:id, 's')
      @mouse_event.click(search_bar)
      @keyboard_events.input_text(search_bar, "buds")
      puts "Searched the product: buds"

      @keyboard_events.enter_key(search_bar)

      search_item = @web_finder.find_element(:css, 'h2')
      result = get_text(search_item)

      puts "Selected the product and fetched the details below ---:"
      puts ""

      product = @web_finder.find_element(:css, "[href='https://www.skullcandy.in/shop/earbuds/bluetooth-earbuds/true-wireless/grind-true-wireless-earbuds/']")
      scroll_down(product)
      @mouse_event.click(product)

      puts "<<--product Details-->>"

      details = @web_finder.find_element(:tag_name, "h1")
      title = get_text(details)
      puts "title: #{title}"

      details = @web_finder.find_element(:tag_name, "ins")
      price = get_text(details)
      puts "price: #{price}"

      details = @web_finder.find_element(:css, "div.woovr-variation.woovr-variation-radio.woovr-variation-activate > div.color_row.woovr-variation-selector > div:last-child.woovr-variation-info > div:first-child.img_box > div.woovr-variation-name")
      color = get_text(details)
      puts "color: #{color}"

      puts ""
      puts "Exit the browser"
      puts ""
    rescue StandardError => e
      # puts e
    ensure
      # Close the browser
      @driver.close
    end
  end

  private

  def maximize_window
    @driver.manage.window.resize_to(1920, 1080)
  end

  def visit(url)
    @driver.get(url)
  end

  def get_text(element)
    element.text
  end

  def scroll_down(element)
    # Implement your scrolling logic here
  end
end

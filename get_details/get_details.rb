require 'selenium-webdriver'
require_relative '../MainClass'
require_relative '../WebDriver'

$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)

main_driver = MainDriver.new($d)
mouse_event = MouseEvent.new($d)
keyboard_events = KeyboardEvents.new($d)
web_finder = WebFinder.new($d)

begin
    # Open a webpage
    main_driver.visit('https://www.skullcandy.in/')
  
    # Maximize the window
    main_driver.maximize_window

    search_icon = web_finder.find_element(:id, "menu-item-24420076")
    mouse_event.click(search_icon)
    search_input = web_finder.find_element(:id,"s")

    product_name="buds"

    keyboard_events.input_text(search_input, product_name)
    keyboard_events.enter_key(search_input)

    product = web_finder.web_finder.find_element(:css , "[href='https://www.skullcandy.in/shop/earbuds/bluetooth-earbuds/true-wireless/grind-true-wireless-earbuds/']")

    web_finder.scroll_down(product)
    mouse_event.click(product)

    add_to_cart_btn = web_finder.web_finder.find_element(:class, "custom_single_add_to_cart_button")
    web_finder.scroll_down(add_to_cart_btn)
    mouse_event.click(add_to_cart_btn)

    view_full_bag_btn = web_finder.find_element(:css, "[href='https://www.skullcandy.in/cart/']")
    mouse_event.click(view_full_bag_btn)

    proceed_to_checkout = web_finder.find_element(:class,"wc-proceed-to-checkout")
    mouse_event.click(proceed_to_checkout)

    scroll_to_india = web_finder.find_element(:class, "woocommerce-input-wrapper")
    web_finder.scroll_down(scroll_to_india)
    (scroll_to_india)

  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  ensure
    # Close the browser
    main_driver.close
end

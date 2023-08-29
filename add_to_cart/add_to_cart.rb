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

    #search product
    search_icon = web_finder.find_element(:id,"menu-item-24420076")
    mouse_event.click(search_icon)
    search_input = web_finder.find_element(:id,"s")

    keyboard_events.input_text(search_input,"buds")
    keyboard_events.enter_key(search_input)

    product =  web_finder.find_element(:css, "[href='https://www.skullcandy.in/shop/earbuds/bluetooth-earbuds/true-wireless/grind-true-wireless-earbuds/']")

    
    add_to_cart_btn = web_finder.find_element(:class, "custom_single_add_to_cart_button")

    mouse_event.click(add_to_cart_btn)
    
    view_full_bag_btn =  web_finder.find_element(:css,"[href='https://www.skullcandy.in/cart/']")

    mouse_event.click(view_full_bag_btn)

    proceed_to_checkout = web_finder.find_element(:class, "wc-proceed-to-checkout")
    mouse_event.click(proceed_to_checkout)

    

  
    # # Print the page title
    # puts "Page title: #{main_driver.driver.title}"
    # rescue StandardError => e
    #     puts "An error occurred: #{e.message}"
    # ensure
    # # Close the browser
    # main_driver.close
end



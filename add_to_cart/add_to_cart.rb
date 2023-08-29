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

    product =  web_finder.find_element(:css, "[href='https://www.skullcandy.in/shop/earbuds/bluetooth-earbuds/true-wireless/rail-true-wireless-earbuds/']")


    web_finder.scroll_to_element(product)

    mouse_event.click(product)

    
    add_to_cart_btn = web_finder.find_element(:class, "custom_single_add_to_cart_button")

    mouse_event.click(add_to_cart_btn)

    # sleep(3)

    # web_finder.scroll_down(200)
    sleep(3)

    
    view_full_bag_btn =  web_finder.find_element(:css,"[href='https://www.skullcandy.in/cart/']")



    mouse_event.click(view_full_bag_btn)

    #-----------add to validation here-------------#
    proceed_to_checkout = web_finder.find_element(:class, "wc-proceed-to-checkout")
    mouse_event.click(proceed_to_checkout)
    # sleep(3)

    web_finder.scroll_down(1000)
    # scroll_to_india = web_finder.find_element(:class,"woocommerce-input-wrapper")
    # web_finder.scroll_to_element(scroll_to_india)



    first_name = web_finder.find_element(:id,"billing_first_name")
    keyboard_events.input_text(first_name,"Vaibhav")

    last_name = web_finder.find_element(:id,"billing_last_name")
    keyboard_events.input_text(last_name,"Gaunkar")
    sleep(3)
    

    address = web_finder.find_element(:id,"billing_address_1")
    keyboard_events.input_text(address,"Panjim, Goa")

    city = web_finder.find_element(:id,"billing_city")
    keyboard_events.input_text(city,"Panjim")

    dropdown = web_finder.find_element(:id, 'billing_state')
    dropdown = Selenium::WebDriver::Support::Select.new(dropdown)

    dropdown.select_by(:value, "GA")
    puts "the selected state is #{dropdown.selected_options[0].text}"

    poste_code = web_finder.find_element(:id,"billing_postcode")
    keyboard_events.input_text(poste_code,"403703")

    poste_code = web_finder.find_element(:id,"billing_phone")
    keyboard_events.input_text(poste_code,"7020488329")

    poste_code = web_finder.find_element(:id,"billing_email")
    keyboard_events.input_text(poste_code,"vaibhavgaunkar96@gmail.com")
    sleep(3)

  
    # Print the page title
    # puts "Page title: #{main_driver.driver.title}"
    rescue StandardError => e
        puts "An error occurred: #{e.message}"
    ensure
    # Close the browser
    main_driver.close
end



require 'selenium-webdriver'
require_relative '../MainClass'
require_relative '../WebDriver'

class AddToCartFlow
    def initialize(driver)
      @driver = driver
      @driver.manage.window.resize_to(1920,1080)
      @web_finder = WebFinder.new(@driver)
      @mouse_event = MouseEvent.new(@driver)
      @keyboard_events = KeyboardEvents.new(@driver)
    end
  
    def run
      begin
        puts "------------ Add to cart web flow -------------------------------->"
        visit('https://www.skullcandy.in/')
  
        # Search product
        search_icon = @web_finder.find_element(:id, "menu-item-24420076")
        @mouse_event.click(search_icon)
        search_input = @web_finder.find_element(:id, "s")
        puts "Searched the product"
  
        @keyboard_events.input_text(search_input, "buds")
        @keyboard_events.enter_key(search_input)
  
        product = @web_finder.find_element(:css, "[href='https://www.skullcandy.in/shop/earbuds/bluetooth-earbuds/true-wireless/rail-true-wireless-earbuds/']")
  
        puts "Wait for the products to load"
        @web_finder.set_implicit_wait(5)
        @mouse_event.click(product)
  
        puts "Select the product"
  
        # Click on add to cart button
        add_to_cart_btn = @web_finder.find_element(:class, "custom_single_add_to_cart_button")
        @mouse_event.click(add_to_cart_btn)
  
        puts "Add the product to the cart"
  
        @web_finder.set_implicit_wait(3)
  
        # Check the product in cart
        view_full_bag_btn = @web_finder.find_element(:css, "[href='https://www.skullcandy.in/cart/']")
        @mouse_event.click(view_full_bag_btn)
        @web_finder.set_implicit_wait(3)
  
        puts "View the cart and verify the product has been added"
  
        # Add validation here
        quantity = @web_finder.find_element(:xpath,"/html/body/section[2]/div/div/div/form/table/tbody/tr[1]/td[5]/div/input")
        puts "quantity: #{quantity.attribute('value')}"
        quantity_value = quantity.attribute('value')
        quantity_value = quantity_value.to_i
    
    
        if quantity_value > 0 && quantity_value < 135
    
            puts "Verified cart"
            proceed_to_checkout = @web_finder.find_element(:class, "wc-proceed-to-checkout")
            @mouse_event.click(proceed_to_checkout)
            puts "Proceed to checkout"
    
            first_name = @web_finder.find_element(:id,"billing_first_name")
            last_name = @web_finder.find_element(:id,"billing_last_name")
            address = @web_finder.find_element(:id,"billing_address_1")
            @web_finder.scroll_down(address)
    
            puts "Filling the checkout form"
    
    
            @keyboard_events.input_text(first_name,"Vaibhav")
            @keyboard_events.input_text(last_name,"Gaunkar")
    
            @web_finder.set_implicit_wait(3)
            
            @keyboard_events.input_text(address,"Panjim, Goa")
    
    
            city = @web_finder.find_element(:id,"billing_city")
            @keyboard_events.input_text(city,"Panjim")
    
            dropdown = @web_finder.find_element(:id, 'billing_state')
            dropdown = Selenium::WebDriver::Support::Select.new(dropdown)
    
    
    
            dropdown.select_by(:value, "GA")
    
            # puts "the selected state is #{dropdown.selected_options[0].text}"
    
            poste_code = @web_finder.find_element(:id,"billing_postcode")
            @keyboard_events.input_text(poste_code,"403703")
    
            poste_code = @web_finder.find_element(:id,"billing_phone")
            @keyboard_events.input_text(poste_code,"7020488329")
    
            poste_code = @web_finder.find_element(:id,"billing_email")
            @keyboard_events.input_text(poste_code,"vaibhavgaunkar96@gmail.com")
            @web_finder.set_implicit_wait(3)
    
            puts "Filling the checout form complete"
        else
            back_to_shopping =  @web_finder.find_element(:css,'[href="https://www.skullcandy.in/shop/"]')
            @mouse_event.click(back_to_shopping)
        end
  
        puts "Exit the browser"
        puts ""
      rescue StandardError => e
        puts "An error occurred: #{e.message}"
      ensure
        # Close the browser
        @driver.close
      end
    end
  
    private
  
    def visit(url)
      @driver.get(url)
    end
end

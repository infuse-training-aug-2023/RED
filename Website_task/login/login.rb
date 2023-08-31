require 'selenium-webdriver'
require_relative '../MainClass'
require_relative '../WebDriver'

class LoginFlow
  def initialize(driver)
    @driver = driver
    @web_finder = WebFinder.new(@driver)
    @mouse_event = MouseEvent.new(@driver)
    @keyboard_events = KeyboardEvents.new(@driver)
    @expected_email = "riyakumbhar2001@gmail.com"
  end

  def run
    begin
      puts "Test for Login ------------------------------------------------> "
      visit('https://www.skullcandy.in/')
      puts "Driver launched browser"
  
      # Maximize the window
      @driver.manage.window.resize_to(1920, 1080)
      puts "Maximized window to full screen"
  
      profile = @web_finder.find_element(:id, 'account')
      email = "riyakumbhar2001@gmail.com"
      @mouse_event.click(profile)
  
      puts "Locating login button..."
  
      username = @web_finder.find_element(:id, 'username')
      password = @web_finder.find_element(:id, 'password')
      puts "Entering credentials..."
      @keyboard_events.input_text(username, 'riyakumbhar2001@gmail.com')
      @keyboard_events.input_text(password, 'thisisadummypass')
      
      login_button = @web_finder.find_element(:css, "button[value='Log in']")
      @mouse_event.click(login_button)
      
      account_setting = @web_finder.find_element(:xpath, "/html/body/section[2]/div/div/div/nav/ul/li[3]/a")
      @mouse_event.click(account_setting) 
  
      puts "Verifying log in..."
  
      email_element = @web_finder.find_element(:id, 'account_email') 
      actual_email = email_element.attribute('value')
  
      logout_button = @web_finder.find_element(:xpath, "/html/body/section[2]/div/div/div/nav/ul/li[6]/a")
      @mouse_event.click(logout_button)
  
      if actual_email == @expected_email
          puts "Login successful for : #{email}"
          return true
      else
          puts "Login failed: Expected email '#{@expected_email}', but got '#{actual_email}'."
          return false
      end
  
      puts "Logged out and Exit the Browser"
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

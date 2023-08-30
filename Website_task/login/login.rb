require 'selenium-webdriver'
require '../MainClass'
require '../WebDriver'

$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)

main_driver = MainDriver.new($d)
mouse_event = MouseEvent.new($d)
keyboard_events = KeyboardEvents.new($d)
web_finder = WebFinder.new($d)
expected_email = "riyakumbhar2001@gmail.com"


begin
    # Open a webpage
    main_driver.visit('https://www.skullcandy.in/')
  
    # Maximize the window
    main_driver.maximize_window

    profile = web_finder.find_element(:id, 'account')
    email = "riyakumbhar2001@gmail.com"
    mouse_event.click(profile)

    username = web_finder.find_element(:id, 'username')
    password = web_finder.find_element(:id, 'password')
    keyboard_events.input_text(username, 'riyakumbhar2001@gmail.com')
    keyboard_events.input_text(password, 'thisisadummypass')
    
    loginButton = web_finder.find_element(:css, "button[value='Log in']")
    mouse_event.click(loginButton)
    
    account_setting = web_finder.find_element(:xpath, "/html/body/section[2]/div/div/div/nav/ul/li[3]/a")
    mouse_event.click(account_setting) 

    email_element = web_finder.find_element(:id, 'account_email') 
    actual_email = email_element.attribute('value')

    logoutButton = web_finder.find_element(:xpath, "/html/body/section[2]/div/div/div/nav/ul/li[6]/a")
    mouse_event.click(logoutButton)

    if actual_email == expected_email
        puts "Login successful for : #{email}"
        return true
    else
        puts "Login failed: Expected email '#{expected_email}', but got '#{actual_email}'."
        return false
    end

  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  ensure
    # Close the browser
    main_driver.close
end

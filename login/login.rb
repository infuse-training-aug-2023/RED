require 'selenium-webdriver'
require '../MainClass'
require '../WebDriver'

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

    profile = web_finder.find_element(:id, 'account')
    mouse_event.click(profile)

    username = web_finder.find_element(:id, 'username')
    password = web_finder.find_element(:id, 'password')
    keyboard_events.input_text(username, 'riyakumbhar2001@gmail.com')
    keyboard_events.input_text(password, 'thisisadummypass')

    loginButton = web_finder.find_element(:css, "button[value='Log in']")
    mouse_event.click(loginButton)

    logoutButton = web_finder.find_element(:xpath, "/html/body/section[2]/div/div/div/nav/ul/li[6]/a")
    mouse_event.click(logoutButton)

  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  ensure
    # Close the browser
    main_driver.close
end

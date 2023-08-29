require 'selenium-webdriver'
require_relative "MainClass"
require_relative "WebDriver"

$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)

main_driver = MainDriver.new($d)
mouse_event = MouseEvent.new($d)
keyboard_events = KeyboardEvents.new($d)
web_finder = WebFinder.new($d)

begin
    # Open a webpage
    main_driver.visit('https://www.techlistic.com/p/selenium-practice-form.html')
  
    # Maximize the window
    main_driver.maximize_window

    fname = web_finder.find_element(:name, 'firstname')
  
    # Print the page title
    puts fname
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
  ensure
    # Close the browser
    main_driver.close
end
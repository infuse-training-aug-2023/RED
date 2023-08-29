require 'selenium-webdriver'
require_relative "MainClass"
require_relative "WebDriver"

driver = Driver.new 

drivers = MainDriver.new(driver)

drivers.visit("https://google.com")

drivers.quit
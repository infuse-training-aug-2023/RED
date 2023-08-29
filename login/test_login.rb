require 'selenium-webdriver'
require_relative 'login1'

Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\adity\Desktop\Drivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
driver = Selenium::WebDriver.for :chrome

skullcandy_page = SkullcandyPage.new(driver)


skullcandy_page.open

skullcandy_page.login('riyakumbhar2001@gmail.com', 'thisisadummypass')

driver.quit

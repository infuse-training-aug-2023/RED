class Driver
    def initialize(browser: :chrome)
        Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\vaibh\OneDrive\Desktop\webdrivers\chromedriver-win64\chromedriver.exe'
        @driver = Selenium::WebDriver.for browser
    end
end
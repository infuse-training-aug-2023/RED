class Driver
    def initialize(browser: :chrome)
        Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Users\neera.yadav\Documents\BrowserDrivers\chromedriver-win64\chromedriver-win64\chromedriver.exe'
        @driver = Selenium::WebDriver.for browser
    end
end
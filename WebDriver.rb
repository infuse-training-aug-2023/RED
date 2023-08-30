class Driver
    def initialize(browser: :chrome)
        Selenium::WebDriver::Chrome::Service.driver_path = 'chromedriver.exe'
        @driver = Selenium::WebDriver.for browser
    end
end

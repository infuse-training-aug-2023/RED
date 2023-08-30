class Driver
    def initialize(browser: :chrome)
        Selenium::WebDriver::Chrome::Service.driver_path = '/usr/local/bin/chromedriver'
        @driver = Selenium::WebDriver.for browser
    end
end
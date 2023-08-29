class Driver
    def initialize(browser: :chrome)
        Selenium::WebDriver::Chrome::Service.driver_path = 'C:/Users/anup.desai/Desktop/project/RED/chromedriver.exe'
        @driver = Selenium::WebDriver.for browser
    end
end

require 'selenium-webdriver'

class Driver
    def initialize(browser: :chrome, headless: true, gpu: true, no_sandbox: true)
        Selenium::WebDriver::Chrome::Service.driver_path = '../driver/chromedriver'
        
        options = Selenium::WebDriver::Chrome::Options.new
        
        if headless
            options.add_argument('--headless')
        end
        
        if gpu
            options.add_argument('--disable-gpu')
        end
        
        if no_sandbox
            options.add_argument('--no-sandbox')
        end

        options.add_argument('--disable-dev-shm-usage')
        
        
        @driver = Selenium::WebDriver.for :chrome, options: options
        
    end
end

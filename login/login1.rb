# login.rb

require_relative '../MainClass'

class Login
  @driver = MainDriver.new;

  @driver.visit("https://www.skullcandy.in/")

  @driver.maximize_window

  profile = @driver.find_element(:id, 'account')
  @driver.click(profile)



end

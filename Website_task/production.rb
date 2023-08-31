require_relative 'WebDriver'
require_relative 'MainClass'
require_relative 'login/login'
require_relative 'add_to_cart/add_to_cart'
require_relative 'get_details/get_details'

# Instantiate the driver
driver_instance = Driver.new(browser: :chrome).instance_variable_get(:@driver)

# Call LoginFlow
login_flow = LoginFlow.new(driver_instance)
login_flow.run

# Call ProductDetailsFlow
product_details_flow = ProductDetailsFlow.new(driver_instance)
product_details_flow.run

# Call AddToCartFlow
add_to_cart_flow = AddToCartFlow.new(driver_instance)
add_to_cart_flow.run

# Close the driver instance after all flows are done
driver_instance.quit
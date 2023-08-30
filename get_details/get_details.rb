require_relative "../MainClass"
require_relative "../WebDriver"

$d = Driver.new(browser: :chrome).instance_variable_get(:@driver)

main_driver = MainDriver.new($d)
mouse_event = MouseEvent.new($d)
keyboard_events = KeyboardEvents.new($d)
web_finder = WebFinder.new($d)

begin
    puts "Browser Opening and Maximizing the window"
    main_driver.maximize_window

    main_driver.visit('https://www.skullcandy.in')
    puts "opening URL: https://www.skullcandy.in\n\n"

    search_botton = web_finder.find_element(:id,'menu-item-24420076')
    mouse_event.click(search_botton)
    puts "Clicking Search Botton"

    search_bar = web_finder.find_element(:id,'s')
    mouse_event.click(search_bar)
    keyboard_events.input_text(search_bar,"buds")
    puts "Searching For items"

    keyboard_events.enter_key(search_bar)
    puts "pressed Enter key"

    search_item = web_finder.find_element(:css,'h2')
    result = main_driver.get_text(search_item)

    puts ''
    puts result
    puts ''



    product = web_finder.find_element(:css,"[href='https://www.skullcandy.in/shop/earbuds/bluetooth-earbuds/true-wireless/grind-true-wireless-earbuds/']")

    web_finder.scroll_down(product)
    puts "scroll_down Down to specific Product\n\n"
    mouse_event.click(product)
    puts "clicking the product\n\n"

    puts "<<--product Details-->>"

    details = web_finder.find_element(:tag_name,"h1")
    title = main_driver.get_text(details)
    puts "title: #{title}"

    details = web_finder.find_element(:tag_name,"ins")
    price = main_driver.get_text(details)
    price = main_driver.get_text(details)
    puts "price: #{price}"

    details = web_finder.find_element(:css,"div.woovr-variation.woovr-variation-radio.woovr-variation-activate > div.color_row.woovr-variation-selector > div:last-child.woovr-variation-info > div:first-child.img_box > div.woovr-variation-name")
    color = main_driver.get_text(details)
    puts "color: #{color}"

    puts ""
    puts "Closing the Browser"

  rescue StandardError => e
    # puts e
  ensure
    # Close the browser
    main_driver.close
end

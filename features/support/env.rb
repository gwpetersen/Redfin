require 'capybara'
require 'capybara/dsl'

Capybara.run_server = false
#Set default driver as selenium_chrome
Capybara.default_driver = :selenium_chrome
#Set default selector as css
Capybara.default_selector = :css

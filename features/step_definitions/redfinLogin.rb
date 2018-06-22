
require 'selenium-webdriver'


# this test is slightly different from the search propery test 
# its uses a specified chrom driver and not the default capybara driver
# @driver_path the path to your local chromdriver


Selenium::WebDriver::Chrome.driver_path="/Users/garett.petersen/Documents/Repos/redfin/chromedriver5"

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

loginUrl = "https://www.redfin.com/stingray/do/login"

Given("I navigate to redfin login page") do
    puts "running second test to login on redfin at" + loginUrl
    driver.navigate.to loginUrl
end
  
  Given("I enter {string} into the email field") do |string|
    driver.find_element(:css, '#redfin_common_elements_form_ValidationTextBox_5').send_keys("garettpetersen1@gmail.com")
end
  
  Given("I enter {string} into the password field") do |string|
    driver.find_element(:css, '#dijit_form_ValidationTextBox_0').send_keys("Gunner1619")
end
  
  When("I click the Sign in button") do
    driver.find_element(:id, 'redfin_widget_Button_3').click
end
Then("Message displayed Login Successfully with text {string}") do |string|
  element = wait.until { driver.find_element(:class => "brandText") }
  if element.text.include? "Sell for more"
    puts "You have successfully logged in"
  end
end

# Given("I navigate to redfin login page") do
#   visit "https://www.redfin.com/stingray/do/login"
# end

# Given("I enter {string} into the email field") do |string|
#   within(:xpath, './/div[@id="login_form"]') do
#       fill_in('#redfin_common_elements_form_ValidationTextBox_5', :with => 'garettpetersen1@gmail.com')
#   end
#   # page.find('#redfin_common_elements_form_ValidationTextBox_5').send_keys("garettpetersen1@gmail.com")
# end

# Given("I enter {string} into the password field") do |string|
#   within(:xpath, './/div[@id="login_form"]') do
#       fill_in('#dijit_form_ValidationTextBox_0', :with => 'Gunner1619')
#   end
#   # driver.find_element(:css, '#dijit_form_ValidationTextBox_0').send_keys("Gunner1619")
# end

# When("I click the Sign in button") do
#   page.find('#redfin_widget_Button_3').click
# end

# Then("Message displayed Login Successfully with text {string}") do |string|
#   element = page.find(".brandText")
#   if element.text.include? "Sell for more"
#       puts "You have successfully logged in"
#   end
# end
  
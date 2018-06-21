require 'selenium-webdriver'

# require 'capybara/cucumber'

Selenium::WebDriver::Chrome.driver_path="/Users/garett.petersen/Documents/Repos/redfin/chromedriver5"

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

loginUrl = "https://www.redfin.com/stingray/do/login"

Given("I navigate to redfin login page") do
    puts loginUrl
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
  
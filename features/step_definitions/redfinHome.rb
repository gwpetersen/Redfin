require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path="/Users/garett.petersen/Documents/Repos/redfin/chromedriver5"

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds 



Given("I navigate to redfin home page") do
    driver.navigate.to "https://www.redfin.com"
end
  
Given("I enter {string} into the search field") do |string|
    driver.find_element(:id, 'search-box-input').send_keys("Irvine CA 92603")
end
  
When("I click the search button") do
    driver.find_element(:css, '#homepageTabContainer > div > div.TabsContents > div.content.current > div > div > div > form > div > button').click
end

Then("text should be visible {string}") do |string|
    element = wait.until { driver.find_element(:css => "h1[data-rf-test-id*=header]") }
    if element.text.include? "Irvine Real Estate"
      puts "you have successfully searched for your property"
    end
end

Given("I click the more filters button") do
    driver.find_element(:id, 'wideSidepaneFilterButtonContainer').click
end

Then("I should see additional filters") do
    element = wait.until { driver.find_element(:css => "div[class=inner_content]") }
    driver.find_element(:css, 'div[class=inner_content]')
    fewerText = driver.find_element(:css, 'div[class=inner_content]')

end

When("I click the min price filter") do
    element = wait.until { driver.find_element(:css => "span[class*=minPrice] > span") }
    element.click
end
  
Then("I should see min price drop down appear") do
    driver.find_element(:css, 'div[class=flyout]')
end
  
When("I select the {string} on the drop down") do |string|
    driver.find_element(:xpath, "//span[contains(text(), '$100k')]").click
    sleep 3

end

Then("min price filter should be added") do
    element = wait.until { driver.find_element(:css => "span[class*=minPrice] > span.input > span.container >span.value") }
    if element.text.include? "$100k"
      puts "MIN PRICE FILTER ADDED SUCCESSFULLY"
    end
end

When("I click the max price filter") do
    element = wait.until { driver.find_element(:css => "span[class*=maxPrice] > span") }
    element.click
end

Then("I should see max price drop down appear") do
    driver.find_element(:css, 'div[class=flyout]')
end  

When("I click the {string} on the drop down") do |string|
    driver.find_element(:xpath, "//span[contains(text(), '$200k')]").click
    sleep 3

end

Then("max price filter should be added") do
    element = wait.until { driver.find_element(:css => "span[class*=maxPrice] > span.input > span.container >span.value") }
    if element.text.include? "$200k"
      puts "MAX PRICE FILTER ADDED SUCCESSFULLY"
    end
end

When("I click the min beds filter") do
    element = wait.until { driver.find_element(:css => "span[class*=minBeds] > span") }
    element.click
    sleep 3
end

Then("I should see min beds drop down appear") do
    driver.find_element(:css, 'div[class=flyout]')
end
When("I click the {string} on the min bed drop down") do |string|
    driver.find_element(:xpath, "//div[@class='option'] /span[text()='2']").click
    sleep 3
end

Then("{string} min beds filter should be added") do |string|
    element = wait.until { driver.find_element(:css => "span[class*=maxPrice] > span.input > span.container >span.value") }
    if element.text.include? "2"
      puts "MIN BED FILTER ADDED SUCCESSFULLY"
    end
end
  
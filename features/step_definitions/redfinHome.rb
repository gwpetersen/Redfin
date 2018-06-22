require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'

# this test is slightly different from the login test
# its uses the default capybara driver as specified in env.rb


Given("I navigate to redfin home page") do
    visit "https://www.redfin.com"
end
  
Given("I enter {string} into the search field") do |string|

    within(:xpath, './/div[@id="homepageTabContainer"]') do
		fill_in('search-box-input', :with => 'Irvine CA 92603')
	    end
end
  
When("I click the search button") do
    within(:xpath, './/div[@id="homepageTabContainer"]') do
		click_button('Search')
	    end
end

Then("text should be visible {string}") do |string|
    within(:xpath, './/div[@id="sidepane-header"]') do
        page.find('h1[data-rf-test-id*=header]')
	    end
   
end

Given("I click the more filters button") do
    sleep 2
    page.find('#wideSidepaneFilterButtonContainer').click

end

Then("I should see additional filters") do
    page.assert_selector('div[class=inner_content]')

end

When("I click the min price filter") do

    page.find('span[class*=minPrice] > span').click
end
  
Then("I should see min price drop down appear") do
    page.assert_selector('div[class=flyout]')
end
  
When("I select the {string} on the drop down") do |string|
    page.find(:xpath, "//span[contains(text(), '$100k')]").click
    sleep 2

end

Then("min price filter should be added") do
    element = page.find("span[class*=minPrice] > span.input > span.container >span.value")
    if element.text.include? "$100k"
      puts "MIN PRICE FILTER ADDED SUCCESSFULLY"
    end
end

When("I click the max price filter") do
    sleep 2
    page.find('span[class*=maxPrice] > span').click
end

Then("I should see max price drop down appear") do
    page.assert_selector('div[class=flyout]')
end  

When("I click the {string} on the drop down") do |string|
    page.find(:xpath, "//span[contains(text(), '$200k')]").click
    sleep 3

end

Then("max price filter should be added") do
    element = page.find("span[class*=maxPrice] > span.input > span.container >span.value")
    if element.text.include? "$200k"
      puts "MAX PRICE FILTER ADDED SUCCESSFULLY"
    end
end

When("I click the min beds filter") do
    page.find("span[class*=minBeds] > span").click
    sleep 2
end

Then("I should see min beds drop down appear") do
    page.assert_selector('div[class=flyout]')
end
When("I click the {string} on the min bed drop down") do |string|
    page.find(:xpath, "//div[@class='option'] /span[text()='2']").click
    sleep 2
end

Then("{string} min beds filter should be added") do |string|
    element = page.find(:css, "span[class*=maxPrice] > span.input > span.container >span.value")
    if element.text.include? "2"
      puts "MIN BED FILTER ADDED SUCCESSFULLY"
    end
end



  
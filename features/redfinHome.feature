Feature: Search Property


Scenario: Successful Search for Property
	Given I navigate to redfin home page
	And I enter "Irvine CA 92603" into the search field
	When I click the search button
	Then text should be visible "Irvine Real Estate"
    Given I click the more filters button
    Then I should see additional filters
    When I click the min price filter
    Then I should see min price drop down appear
    When I select the "100K" on the drop down
    Then min price filter should be added
    When I click the max price filter
    Then I should see max price drop down appear
    When I click the "200k" on the drop down
    Then max price filter should be added
    When I click the min beds filter
    Then I should see min beds drop down appear
    When I click the "2" on the min bed drop down
    Then "2" min beds filter should be added

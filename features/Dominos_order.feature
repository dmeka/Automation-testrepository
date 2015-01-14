@orderonline
Feature: Placing an online order
  Creating a scenario to to place an online order


  Scenario: Ordering pizza on the dominos website

    When I visit the Dominos Home page
    Then I click on the order online link
    Then I fill the details
    Then I click on the Continue button
    Then I check the total on my order
    Then I add extras
    Then I check my total again
    Then I add specialty pizza



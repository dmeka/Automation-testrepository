@orderonline
Feature: Placing an online order
  Creating a scenario to to place an online order

  @placeorder
  Scenario: Ordering pizza on the dominos website
    When I visit the Dominos Home page
    Then I click on the order online link
    Then I fill the details to place the online order

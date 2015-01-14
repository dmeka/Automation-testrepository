Feature: Ordering muliple pizzas
@mpizzas
Scenario Outline: Ordering multiple pizzas from different locations

Given I am on the Dominos home page after clearing cache for each scenario
Then I click on the Order Online link
    And I choose Carryout Option
    And I select "<address_type>" from address type drop-down
    And I enter "<street_address>" in the street address input field
    And I enter "<city>" in the city input field
    And I select "<state>" from state drop-down
    And I enter "<zip_code>" in the zip code input field
    Then I choose a <store_id> to carryout
    Then I click on Build your own pizza link
    Then I create a custom pizza
	  Then I add few coupon codes
	  Then I check my order total
    Then I clear the cookies


Examples:
   | address_type  | street_address        |  city        | state | zip_code | store_id |
   | Business      | 7950 Jones Branch Dr  |  McLean      | VA    | 22102  | 4348 |
   | Other         | 1941 Roland clarke pl   |  Reston  | VA    | 20191   | 4394 |


@customorder
	Feature: Placing an online order
	Scenario: Ordering pizza on the dominos website

	When I navigate to Dominos Home page
	Then I click on ordering online link
	Then I choose the carryout option
	Then I fill the necessary details
	Then I click on Build your own pizza link
	Then I place a custom order
	Then I add few coupon codes
	Then I check my order total

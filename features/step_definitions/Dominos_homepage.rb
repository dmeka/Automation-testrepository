When(/^I visit the Dominos home page$/) do
  visit('http://order.dominos.com/en/')
end
 Then(/^I should see the orderonline link$/) do
 	click_link('Order Online')
 end




Given(/^I am on the Dominos home page after clearing cache for each scenario$/) do
  #Clear cache and cookies
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
  visit('https://order.dominos.com/en/')
end


Then(/^I click on the Order Online link$/) do
    find('.qa-Cl_order').click
end

Then(/^I choose Carryout Option$/) do
  find('.Carryout').click
end

Then(/^I select "(.*?)" from address type drop\-down$/) do |address_type|
  select(address_type, :from => 'Address_Type_Select')
end

Then(/^I enter "(.*?)" in the street address input field$/) do |street_address|
   fill_in('Street', :with => street_address)
end

Then(/^I enter "(.*?)" in the city input field$/) do |city|
  fill_in('City', :with => city)
end

Then(/^I select "(.*?)" from state drop\-down$/) do |state|
 select(state, :from => 'Region')
end

Then(/^I enter "(.*?)" in the zip code input field$/) do |zip_code|
  fill_in('Postal_Code', :with => zip_code)
  find_button('Continue').click
end

Then(/^I choose a (\d+) to carryout$/) do | store_id |
  find(:xpath,"//div[@data-storeid = #{store_id}]//a[@data-type='Carryout']").click
end

Then(/^I click on Build your own pizza link$/) do
find(:css,'a.qa-BYO').click
end

Then(/^I create a custom pizza$/) do
  find(:xpath,"//a[@class='js-next btn btn--small btn--next']").click
  select('Extra', :from => 'Weight|X')
  find(:xpath,"//a[@class='js-next btn btn--small btn--next']").click
  find(:css,'button.js-closePizzaMessage:nth-child(2)').click
  check('Premium Chicken')
  check('Jalapeno Peppers')
  check('Pineapple')
  find_button('Add to Order').click
end

Then(/^I add few coupon codes$/) do
  find(:xpath,"//a[@class='navigation-coupons']").click
  # Adding 2 medium 2 topping handmade pizza coupon $8.99
  find(:xpath,"//a[@href='#/order/coupons/new?code=9204&qty=1']").click
  #Adding build your own pizza after adding the coupon
  find(:xpath,"//a[@href='#/product/S_PIZZA/builder/?couponCode=9204&code=12SCREEN']").click
  find(:xpath,"//a[@class='js-next btn btn--small btn--next']").click
  find(:xpath,"//a[@class='js-next btn btn--small btn--next']").click
  check('Premium Chicken')
  check('Green Peppers')
  find(:xpath,"//button[@class='btn btn--large js-isNew js-addToOrder btn--block']").click
  find(:xpath,"//a[@class='card--overlay__close js-closeButton']").click
  find(:xpath,"//a[@class='btn btn--large btn--checkout js-buttonCheckout qa-AllChek']").click
  click_link('Checkout')
end

Then(/^I check my order total$/) do
  new_total=find(:xpath,"//td[@class='finalizedTotal js-total']").native.text
  #expect(new_total).to eq("$28.65")
  print new_total
end

Then(/^I clear the cookies$/) do
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
end






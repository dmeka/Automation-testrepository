When(/^I navigate to Dominos Home page/) do
 visit('https://order.dominos.com/en/')
end

Then(/^I click on ordering online link$/) do
  find('.qa-Cl_order').click
end

Then(/^I choose the carryout option$/) do
  find('.Carryout').click

end

Then(/^I fill the necessary details$/)do
       
        select('Business', :from => 'Address_Type_Select')
 		    fill_in('Street', :with => '7950 jones branch dr')
  			fill_in('City', :with => 'Mc Lean')
  			select('VA', :from => 'Region')
  			fill_in('Postal_Code', :with => '22102')
        find_button('Continue').click
      end

      Then(/^I click on Build your own pizza link$/) do
      find(:xpath,"//div[@data-storeid='4348']//a[@data-type='Carryout']").click
      find(:css,'a.qa-BYO').click
       
       
end
Then(/^I place a custom order$/) do
find(:css,'a.js-next:nth-child(2)').click
find(:css,'div.toppingSettings:nth-child(3) > div:nth-child(1) > label:nth-child(1)').click
select('Extra', :from => 'Weight|X')
find(:css,'a.js-next:nth-child(2)').click
find(:css,'button.js-closePizzaMessage:nth-child(2)').click
find(:css,'#toppingsWrapper > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > label:nth-child(1) > input:nth-child(1)').click
check('Premium Chicken')
check('Jalapeno Peppers')
check('Pineapple')
find_button('Add to Order').click
find(:css,'a.card--overlay__close').click

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
  expect(new_total).to eq('$28.65')
  print new_total
end



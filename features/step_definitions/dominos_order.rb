When(/^I visit the Dominos Home page$/) do
 visit('https://order.dominos.com/en/')
end


Then(/^I click on the order online link$/) do
  find('.qa-Cl_order').click
end

Then(/^I fill the details$/)do
   
			  find('.Delivery').click
       select('Business', :from => 'Address_Type_Select')
 		    fill_in('Street', :with => '7950 jones branch dr')
  			fill_in('City', :with => 'Mc Lean')
  			select('VA', :from => 'Region')
  			fill_in('Postal_Code', :with => '22102')
      end

Then(/^I click on the Continue button$/) do
  find_button('Continue').click
        
        click_link('Popular Items')
        click_link('Large (14") Hand Tossed Pizza')
        #find(:css,'#Future_Time').click
        #select('11:00 am', :from => 'Future_Time')
        #find(:css,'button.btn.btn--future-time').click
        find(:css, 'a.qa-Coupon.grid > div.grid__cell--three-quarters.media__body > h2.media__title').click
        find(:css, 'a.findCouponButton').click
        click_link('Checkout')
        
end

Then(/^I check the total on my order$/) do
  
  #Order_total=find(:xpath, '/html/body/div[3]/div[2]/div/div/div/div[2]/div/div[2]/div/table[3]/tbody/tr[4]/td[2]').native.text
  #Order_total=find(:xpath, "//table[@class='order-summary__totals']/tbody/tr[4]/td[2]").native.text
  Order_total=find(:xpath, "//td[@class='finalizedTotal js-total']").native.text
  
  print Order_total
  expect(Order_total).to eq('$15.21')
end

Then(/^I add a coupon code$/) do
  find(:xpath,"//a[@class='navigation-coupons']").click
  find(:xpath,"//a[@href='#/order/coupons/new?code=8118&qty=1']").click
 
 find(:xpath,"//a[@href='#/order/variant/new?code=2LCOKE&qty=1']").click
find(:xpath,"//a[@href='#/product/F_PBITES/builder/?couponCode=8118&code=B16PBIT']").click
find(:xpath,"//div[@class='form__control-group--actions--alignright']/button[@class='btn js-isNew']").click
#find(:xpath,'/html/body/div[20]/div/a').click--This is to click on the Add to order link
 click_link('Checkout')
        end

Then(/^I add extras$/) do
  #click_link("href=#/product/S_BONEIN/builder/?code=W08PHOTW&sides=Bd:1", match: :first)
  click_link('8-piece Hot Wings', match: :first)
  
  #find(:xpath,"//a[@href='#/product/S_BONEIN/builder/?code=W08PHOTW&sides=Bd:1']").click
 find(:xpath,"//div[@class='form__control-group--actions--alignright']/button[@class='btn btn--large js-isNew']").click
end

Then(/^i check my total again$/) do
  new_total=find(:xpath, "//td[@class='finalizedTotal js-total']").native.text
  expect(new_total).to eq('$27.91')
end
        
When(/^I visit the Dominos Home page$/) do
 visit('https://order.dominos.com/en/')
end


Then(/^I click on the order online link$/) do
  find('.qa-Cl_order').click
end

Then(/^I fill the details$/)do
   sleep 10
			  find('.Delivery').click
       
            select('Business', :from => 'Address_Type_Select')
 		    fill_in('Street', :with => '7950 jones branch dr')
  			fill_in('City', :with => 'Mc Lean')
  			select('VA', :from => 'Region')
  			fill_in('Postal_Code', :with => '22102')
      end

Then(/^I click on the Continue button$/) do
  find_button('Continue').click
        sleep 5
        click_link('Popular Items')
        click_link('Large (14") Hand Tossed Pizza')
        #find(:css,'#Future_Time').click
        #select('11:00 am', :from => 'Future_Time')
        #find(:css,'button.btn.btn--future-time').click
        find(:css, 'a.qa-Coupon.grid > div.grid__cell--three-quarters.media__body > h2.media__title').click
        find(:css, 'a.findCouponButton').click
        click_link('Checkout')
        #click_link('Continue Checkout')
        #expect(page).to have_title('Entrees Home - Domino\'s Pizza, Order Pizza Online for Delivery - Dominos.com')
end

Then(/^I check the total on my order$/) do
  Order_total=find(:xpath,'//div[1]/div[2]/div/div/div/div[2]/div/div[2]/div/table[3]/tbody/tr[3]/td[2]')
  #Order_total=find(:xpath,'//div[1]/div[2]/div/div/div/div[2]/div/div[2]/div/table[3]/tbody/tr[4]/td[2]').value
  print Order_total
end

Then(/^I add a coupon code$/) do
  find(:css,'a.navigation-coupons').click
 find(:xpath,"//div[@id='js-pageSplit']/section/div/div[4]/div[2]/div/a").Click
 click_link('Checkout')
        end

Then(/^I add extras$/) do
  find(:xpath,'//div[1]/div[2]/div/div/div/div[2]/section/div/div[3]/a').Click
end

Then(/^i check my total again$/) do
  new_total=find(:xpath,'//div[1]/div[2]/div/div/div/div[2]/div/div[2]/div/table[4]/tbody/tr[4]/td[2]').native.text
  expect(page).to.have('new_total')
end
        
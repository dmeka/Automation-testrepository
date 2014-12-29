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
        
end

Then(/^I check the total on my order$/) do
  
  Order_total=find(:xpath, '/html/body/div[3]/div[2]/div/div/div/div[2]/div/div[2]/div/table[3]/tbody/tr[4]/td[2]').native.text
  print Order_total
  expect(Order_total).to eq('$15.21')
end

Then(/^I add a coupon code$/) do
  find(:xpath,'/html/body/header/nav/div[2]/ul/li[6]/a').click
  find(:xpath,'/html/body/div[3]/div[1]/div/section/div/div[6]/div[2]/div/a').click
 find(:xpath,'/html/body/div[20]/div/div[4]/div[2]/div[2]/div/div[2]/p/a').click
 find(:xpath,'/html/body/div[20]/div/div[4]/div[2]/div/div/div[2]/p/a').click
find(:xpath,'/html/body/div[20]/div/div[2]/div[3]/div[2]/form/div[3]/button').click
find(:xpath,'/html/body/div[20]/div/a').click
 click_link('Checkout')
        end

Then(/^I add extras$/) do
  find(:xpath,'/html/body/div[3]/div[2]/div/div/div/div[2]/section/div/div[2]/a').click
  find(:xpath,'/html/body/div[20]/div/div[2]/div/div[2]/form/div[3]/button').click
end

Then(/^i check my total again$/) do
  new_total=find(:xpath,'/html/body/div[3]/div[2]/div/div/div/div[2]/div/div[2]/div/table[6]/tbody/tr[5]/td[2]').native.text
  expect(new_total).to eq('$27.91')
end
        
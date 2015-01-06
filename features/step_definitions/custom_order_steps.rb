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
        #find(:xpath,'/html/body/header/nav/div[3]/div[2]/ul/li[2]/a').click
        find(:css,'a.qa-BYO').click
       
       #find (:xpath,'//div[@id='pizzaSummaryInColumn']//button[@type='submit’].click
end
Then(/^I place a custom order$/) do
find(:css,'a.js-next:nth-child(2)').click
find(:css,'div.toppingSettings:nth-child(3) > div:nth-child(1) > label:nth-child(1)').click
sleep 10
select('Extra', :from => 'Weight|X')
sleep 10

find(:css,'a.js-next:nth-child(2)').click
#click_link('No Thanks')
find(:css,'button.js-closePizzaMessage:nth-child(2)').click
sleep 10
find(:css,'#toppingsWrapper > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > div:nth-child(2) > label:nth-child(1) > input:nth-child(1)').click
check('Premium Chicken')
check('Jalapeno Peppers')
check('Pineapple')
#find(:css,'button.btn—block').click
find_button('Add to Order').click
find(:css,'a.card--overlay__close').click
#find(:xpath,'/html/body/div[21]/div/div[2]/form/div[4]/div[2]/div[2]').click
end

Then(/^I add few coupon codes$/) do
  find(:xpath,'/html/body/header/nav/div[2]/ul/li[6]/a').click
  find(:xpath,'/html/body/div[3]/div[1]/div/section/div/div[6]/div[2]/div/a').click
 find(:xpath,'/html/body/div[20]/div/div[4]/div[2]/div[2]/div/div[2]/p/a').click
 find(:xpath,'/html/body/div[20]/div/div[4]/div[2]/div/div/div[2]/p/a').click
find(:xpath,'/html/body/div[20]/div/div[2]/div[3]/div[2]/form/div[3]/button').click
find(:xpath,'/html/body/div[20]/div/a').click
 click_link('Checkout')
end
Then(/^I check my order total$/) do
  new_total=find(:xpath,'/html/body/div[3]/div[2]/div/div/div/div[2]/div/div[2]/div/table[3]/tbody/tr[3]/td[2]').native.text
  expect(new_total).to eq('14.83')
  print new_total
end



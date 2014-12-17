When(/^I visit the Dominos Home page$/) do
 visit('https://order.dominos.com/en/')
end


Then(/^I click on the order online link$/) do
  click_link('Order Online')
end

Then(/^I fill the details to place the online order$/) do
			  find('.Delivery').click
        sleep 5
            select('Business', :from => 'Address_Type_Select')
 		    fill_in('Street', :with => '7950 jones branch dr')
  			fill_in('City', :with => 'Mc Lean')
  			select('VA', :from => 'Region')
  			fill_in('Postal_Code', :with => '22102')
  			find_button('Continue').click
  			click_link('Popular Items')
        require "debug"
  			click_link('Large (14") Hand Tossed Pizza')
  			click_link('Checkout')
        find(:xpath, "//div[@class='js-beverageUpsell']/table[2]/tbody/tr/td/div/div[2]/div[2]/input").click
        find(:css, '2LSPRITE').click
  			#click_link('2LCOKE')
  			click_link('Continue Checkout')
end
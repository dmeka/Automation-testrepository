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

        find(:css, 'a.qa-Coupon.grid > div.grid__cell--three-quarters.media__body > h2.media__title').click
        find(:css, 'a.findCouponButton').click
        click_link('Checkout')

  end

    Then(/^I check the total on my order$/) do


        Order_total=find(:xpath, "//td[@class='finalizedTotal js-total']").native.text

        print Order_total
        expect(Order_total).to eq('$15.21')
  end

    #Then(/^I add a coupon code$/) do
        #find(:xpath,"//a[@class='navigation-coupons']").click
        #find(:xpath,"//a[@href='#/order/coupons/new?code=9171&qty=1']").click

        #find(:xpath,"//a[@href='#/order/variant/new?code=2LCOKE&qty=1']").click
        #find(:xpath,"//a[@href='#/product/F_PBITES/builder/?couponCode=8118&code=B16PBIT']").click
        #find(:xpath,"//div[@class='form__control-group--actions--alignright']/button[@class='btn js-isNew']").click

      #click_link('Checkout')
  #end

    Then(/^I add extras$/) do

        click_link('8-piece Hot Wings', match: :first)
        find(:xpath,"//div[@class='form__control-group--actions--alignright']/button[@class='btn btn--large js-isNew']").click
    end

      Then(/^I check my total again$/) do
        new_total=find(:xpath, "//td[@class='finalizedTotal js-total']").native.text
        expect(new_total).to eq('$15.21')
    end
      Then(/^I add specialty pizza$/) do
        click_link("Home")
        click_link("Order Online")
        find(:css,'a.qa-Specialty.grid').click
        click_link('Buffalo Chicken Pizza', match: :first)
        #find(:xpath,".//*[@id='categoryPage2']/section[2]/div/div[7]/a").click
        find(:xpath,"//button[@class='btn btn--large js-isNew']").click
        click_link('Checkout')
        find(:xpath,"//div[@data-product='F_COKE']").click

    end

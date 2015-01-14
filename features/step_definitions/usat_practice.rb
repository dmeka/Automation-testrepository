Given(/^I am on the USAT Home page$/) do
  browser = Capybara.current_session.driver.browser
  browser.manage.delete_all_cookies
  visit('http://www.usatoday.com')
end

Then(/^I click on the News Tab$/) do
  find(:xpath,"//span[@class ='site-nav-span site-nav-span-theme-usatoday site-nav-end-span site-nav-first-primary-span site-nav-text-span news-theme-bg-hover usatoday-theme-bg-hover site-nav-news-span']").click
end

Then(/^I click on the right arrow to do go to the next section$/) do
	click_link("sports")
  #find(:xpath,"//div[@class='front-next-story-content-holder']//p[@class ='front-next-arrow-label']").click
end

Then(/^i verify that i am on the sports section$/) do
expect(page).to have_content("sports")
end



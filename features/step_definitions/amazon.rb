require 'watir'
require 'watir-scroll'
require 'require_all'
require 'capybara'
require_all 'lib'

Given(/^a user is on Amazon login page$/) do
  # @browser = Watir::Browser.new
  # @browser.goto 'www.amazon.com/'

  @browser = Watir::Browser.new
  @main_page = MainPage.new(@browser)
  @login_page = LoginPage.new(@browser)
  @result_page = ResultPage.new(@browser)
  @product_page = ProductPage.new(@browser)
  @checkout_page = CheckoutPage.new(@browser)
  @product_name = 'arginine'

  @main_page.goto 'www.amazon.com/'
  @main_page.login_button
end

Given(/^a user is logged in$/) do
  # @browser.a(:id => "nav-link-accountList").wait_until_present.click
  # @browser.text_field(:id => 'ap_email').set('abc@gmail.com')
  # @browser.input(:id => 'continue').click
  # @browser.text_field(:id => 'ap_password').set('12345678')
  # @browser.input(:id => 'signInSubmit').click

  @login_page.email = 'bksung0708@gmail.com'
  @login_page.continue_button
  @login_page.password = 'qudrmsdl1'
  @login_page.submit_button
end

When(/^a user types in a product name in a search bar$/) do
  @main_page.search_bar = @product_name
end

And(/^clicks a search button$/) do
  # @browser.input(:type => 'submit').click

  @main_page.search_button
end

Then(/^relevant results of a product name should be displayed$/) do
  expect(@browser.span(:id => 's-result-count').text.include?(@product_name)).to eq true
  @browser.close
end

Given(/^a user is on a search result page$/) do
  # @browser.text_field(:id => 'twotabsearchtextbox').set('arginine')
  # @browser.input(:type => 'submit').click
  # expect(@browser.span(:id => 's-result-count').text.include?('arginine')).to eq true
  @main_page.search_bar = @product_name
  @main_page.search_button
  expect(@browser.span(:id => 's-result-count').text.include?(@product_name)).to eq true
end

When(/^a user clicks a desired product$/) do
  # @browser.h2(:class => ['s-inline', 's-access-title']).click
  @result_page.click_product
end

And(/^clicks Add to Cart button$/) do
  # if (@browser.div(:id => 'onetimeOption').present?)
  #   @browser.div(:id => 'onetimeOption').click
  #   @browser.input(:id => 'add-to-cart-button').click
  # else
  #   @browser.input(:id => 'add-to-cart-button').click
  # end

  if (@product_page.one_time_option?)
    @product_page.click_one_time_option
    @product_page.click_add_button
  else
    @product_page.click_add_button
  end
  sleep 3
end

Then(/^Added to Cart page should be displayed$/) do
  expect(@browser.div(:class => 'a-alert-content').text.include?("Added to your Cart")).to eq true
end

Given(/^a user has more than one item on Cart$/) do
  expect(@browser.span(:id => 'nav-cart-count').text.to_i).to be > 0
end

When(/^a user clicks Cart button$/) do
  @main_page.click_cart
end

And(/^clicks Proceed to checkout button$/) do
  @checkout_page.click_proceed_button
end

And(/^clicks Place your order button$/) do
  # @browser.input(:name => 'placeYourOrder1').click

  # @checkout_page.click_order_button
end

Then(/^Thank you for your purchase page should be displayed$/) do
  # expect(@browser.text.include?("Thank you for your purchase")).to eq true
end

Given(/^a user is on a product page that was previously purchased$/) do
  # @browser.a(:id => 'nav-orders').click
  # @browser.img(:class => 'yo-critical-feature').click

  @main_page.click_my_orders
  @main_page.click_purchased_product
end

When(/^a user clicks Write a customer review button$/) do
  @browser.scroll.to [0,7600]
  # @browser.span(:class => ['a-button', 'writeReviewButton']).click
  @product_page.click_write_review_button
end

And(/^clicks 5 star$/) do
  # @browser.div(:class => ['a-section', 'starSprite', 'bigStar', 'rating_5']).click
  @product_page.click_five_star
end

And(/^writes a review in a text field$/)do
  # @browser.text_field(:id => 'review-body-text-area-0').set('good product')
  @product_page.writing_review = 'good product'
end

And(/^clicks Submit button$/) do
  @product_page.submit_button
end

Then(/^Thank you for your review message should be displayed$/) do
  expect(@browser.text.include?('Thank you for your review')).to eq true
end

require 'watir'
require 'watir-scroll'

Given(/^a user is on www\.amazon\.com$/) do
  @browser = Watir::Browser.new
  @browser.goto 'www.amazon.com/'
end

Given(/^a user is logged in$/) do
  @browser.a(:id => "nav-link-accountList").wait_until_present.click
  @browser.text_field(:id => 'ap_email').set('abc@gmail.com')
  @browser.input(:id => 'continue').click
  @browser.text_field(:id => 'ap_password').set('12345678')
  @browser.input(:id => 'signInSubmit').click
end

When(/^a user types in a product name in a search bar$/) do
  @browser.text_field(:id => 'twotabsearchtextbox').set('arginine')
end

And(/^clicks a search button$/) do
  @browser.input(:type => 'submit').click
end

Then(/^relevant results of a product name should be displayed$/) do
  expect(@browser.span(:id => 's-result-count').text.include?('arginine')).to eq true
  @browser.close
end

Given(/^a user is on a search result page$/) do
  @browser.text_field(:id => 'twotabsearchtextbox').set('arginine')
  @browser.input(:type => 'submit').click
  expect(@browser.span(:id => 's-result-count').text.include?('arginine')).to eq true
end

When(/^a user clicks a desired product$/) do
  @browser.h2(:class => ['s-inline', 's-access-title']).click
end

And(/^clicks Add to Cart button$/) do
  if (@browser.div(:id => 'onetimeOption').present?)
    @browser.div(:id => 'onetimeOption').click
    @browser.input(:id => 'add-to-cart-button').click
  else
    @browser.input(:id => 'add-to-cart-button').click
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
  @browser.a(:id => 'nav-cart').click
end

And(/^clicks Proceed to checkout button$/) do
  @browser.input(:name => 'proceedToCheckout').click
end

And(/^clicks Place your order button$/) do
  # @browser.input(:name => 'placeYourOrder1').click
end

Then(/^Thank you for your purchase page should be displayed$/) do
  # expect(@browser.text.include?("Thank you for your purchase")).to eq true
end

Given(/^a user is on a product page that was previously purchased$/) do
  @browser.a(:id => 'nav-orders').click
  @browser.img(:class => 'yo-critical-feature').click
end

When(/^a user clicks Write a customer review button$/) do
  @browser.scroll.to [0,7600]
  @browser.span(:class => ['a-button', 'writeReviewButton']).click
end

And(/^clicks 5 star$/) do
  @browser.div(:class => ['a-section', 'starSprite', 'bigStar', 'rating_5']).click
end

And(/^writes a review in a text field$/)do
  @browser.text_field(:id => 'review-body-text-area-0').set('good product')
end

And(/^clicks Submit button$/) do
  @browser.input(:type => 'submit').click
end

Then(/^Thank you for your review message should be displayed$/) do
  expect(@browser.text.include?('Thank you for your review')).to eq true
end

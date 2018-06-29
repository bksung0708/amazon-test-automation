require 'page-object'

class CheckoutPage
  include PageObject

  button(:proceed_button, :name => 'proceedToCheckout')
  button(:order_button, :name => 'placeYourOrder1')

  def click_proceed_button
    proceed_button_element.click
  end

  def click_order_button
    order_button_element.click
  end
end

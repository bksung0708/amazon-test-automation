require 'page-object'

class MainPage
  include PageObject

  # page_url('http://www.amazon.com')
  a(:login_button, :id => 'nav-link-accountList')
  text_field(:search_bar, :id => 'twotabsearchtextbox')
  button(:search_button, :type => 'submit')
  a(:cart, :id => 'nav-cart')
  a(:my_orders, :id => 'nav-orders')
  image(:purchased_product, :class => 'yo-critical-feature')

  def click_cart
    cart_element.click
  end

  def click_my_orders
    my_orders_element.click
  end

  def click_purchased_product
    purchased_product_element.click
  end
end

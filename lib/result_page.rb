require 'page-object'

class ResultPage
  include PageObject

  span(:search_result, :id => 's-result-count')
  h2(:select_product, :class => ['s-inline', 's-access-title'])

  def click_product
    select_product_element.click
  end
end

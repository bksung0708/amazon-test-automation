require 'page-object'

class ProductPage
  include PageObject

  div(:one_time_option, :id => 'onetimeOption')
  button(:add_button, :id => 'add-to-cart-button')
  span(:write_review_button, :class => ['a-button', 'writeReviewButton'])
  div(:five_star, :class => ['a-section', 'starSprite', 'bigStar', 'rating_5'])
  text_area(:writing_review, :id => 'review-body-text-area-0')
  button(:submit_button, :type => 'submit')

  def one_time_option?
    one_time_option_element.visible?
  end

  def click_one_time_option
    one_time_option_element.click
  end

  def click_add_button
    add_button_element.click
  end

  def click_write_review_button
    write_review_button_element.click
  end

  def click_five_star
    five_star_element.click
  end
end

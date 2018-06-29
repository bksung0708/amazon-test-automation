Feature: As a returning Amazon user, he/she should be able to search for a product, add a product to a shopping cart,
  place an order, and write a review on a product.

  Background:
    Given a user is on Amazon login page
    Given a user is logged in

    Scenario: Search for a product
      When a user types in a product name in a search bar
      And clicks a search button
      Then relevant results of a product name should be displayed

    Scenario: Add a product to a shopping cart
      Given a user is on a search result page
      When a user clicks a desired product
      And clicks Add to Cart button
      Then Added to Cart page should be displayed

    Scenario: Place an order
      Given a user has more than one item on Cart
      When a user clicks Cart button
      And clicks Proceed to checkout button
      And clicks Place your order button
      Then Thank you for your purchase page should be displayed

    Scenario: Write a review on a product
      Given a user is on a product page that was previously purchased
      When a user clicks Write a customer review button
      And clicks 5 star
      And writes a review in a text field
      And clicks Submit button
      Then Thanks for your review message should be displayed

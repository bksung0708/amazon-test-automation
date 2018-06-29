require 'page-object'

class LoginPage
  include PageObject

  text_field(:email, :id => 'ap_email')
  text_field(:password, :id => 'ap_password')
  button(:continue_button, :id => 'continue')
  button(:submit_button, :id => 'signInSubmit')
end

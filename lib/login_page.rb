require 'page-object'

class LoginPage
  include PageObject

  text_field(:email, :id => 'ap_email')
  text_field(:password, :id => 'qudrmsdl1')
  button(:continue_button, :id => 'continue')
  button(:sign_in_button, :id => 'signInSubmit')
end

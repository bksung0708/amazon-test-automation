require 'page-object'
# require 'fig_newton'

class HomePage
  include PageObject

  def initialize(url)
    @browser = Watir::Browser.new
    @browser.navigate.to url
  end
  
  # page_url FigNewton.baseurl
end

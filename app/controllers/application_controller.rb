class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
=begin  
  def hello
    render html: "hello world"
  end
=end
end

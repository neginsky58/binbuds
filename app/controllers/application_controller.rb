class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token  
  layout :layout_by_resource
  
  after_action :allow_facebook_iframe

  

  private

  def allow_facebook_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://apps.facebook.com'
  end


  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end




end

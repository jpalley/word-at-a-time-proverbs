# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :setup_params
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def setup_params
    @app_url = (Rails.env == "development") ? "http://jonathanpalley.com:4007" : "http://improv.jonathanpalley.com"
  end
end

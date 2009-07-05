class FacebookBaseController < ApplicationController
  ensure_application_is_installed_by_facebook_user
  before_filter :get_user
  def after_facebook_login_url
    "proverbs"
  end

  private
  def get_user
      @current_user =
        User.find_or_create_by_uid(facebook_session.user.id)
      @facebook_session = facebook_session
  end
end
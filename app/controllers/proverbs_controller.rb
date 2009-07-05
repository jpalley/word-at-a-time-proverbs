class ProverbsController < FacebookBaseController
  skip_before_filter :ensure_appliation_is_installed_by_facebook_user, :only=>[:profile]
  def index
    @proverbs = (params[:order] == 'latest') ? Proverb.all(:conditions=>'completed_at is not null', :order=>'completed_at DESC', :limit=>100):  Proverb.all(:conditions=>'completed_at is not null', :order=>'score DESC', :limit=>100) 
  end
  
  def profile
    @user = User.find_by_uid(params[:fb_sig_profile_id])
  end
  
end

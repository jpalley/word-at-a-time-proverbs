class UsersController < FacebookBaseController
  layout 'proverbs'
  def index
    @users = User.find(:all, :order=>'score DESC', :limit=>50)
  end
  
  
end

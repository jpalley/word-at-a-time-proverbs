class ProverbsController < FacebookBaseController
  def index
    @proverbs = (params[:order] == 'latest') ? Proverb.all(:conditions=>'completed_at is not null', :order=>'completed_at DESC', :limit=>100):  Proverb.all(:conditions=>'completed_at is not null', :order=>'score DESC', :limit=>100) 
  end
  
  
end

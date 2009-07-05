class CategoriesController < FacebookBaseController
  layout 'proverbs'
  def index
    order = params[:order] == 'popularity' ? "proverb_count DESC" : "created_at DESC"
    @categories = Category.all(:order=>order)
    @my_categories = CategorySubscriber.all(:conditions=>['user_id = ?', @current_user.id]).map{|cs| cs.category}
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(:name=>params[:category][:name], :creator_id=>@current_user.id)
    @word = params[:category][:first_word].split(' ').first.capitalize
   
    if (not @word.empty?) and @category.save
      @proverb = @category.proverbs.create(:started_at=>Time.now.utc, :score=>0)
      @proverb.proverb_words.create(:word=>@word, :user_id=>@current_user.id)
      @category.category_subscribers.create(:user_id=>@current_user.id)
      ActionPublisher.deliver_new_category(facebook_session.user, @category, @word)
      render
    else
      render :action=>:new
    end
  end
  
  def show
    @category = Category.find(params[:id])   
    CategorySubscriber.find_or_create_by_user_id_and_category_id(@current_user.id, params[:id])
    @proverbs = (params[:order] == 'highest') ? @category.proverbs.all(:condition=>'completed_at is not null', :order=>'score DESC', :limit=>20) : @category.proverbs.all(:conditions=>'completed_at is not null', :order=>'completed_at DESC', :limit=>20)
    @new_proverb = @category.proverbs.last
  end
  
   def add_friends
     @proverb = Proverb.find(params[:id])
  #   @proverb.proverb_subscribers.create
    redirect_to :show, :id=>params[:id]
  end
  # end
end

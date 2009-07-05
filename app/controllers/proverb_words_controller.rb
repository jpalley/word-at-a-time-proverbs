class ProverbWordsController < FacebookBaseController
  def create
    @proverb = Proverb.find(params[:proverb_id])
    word = params[:word]
    if word.empty?
      flash[:error] = "You must enter a word!"
      redirect_to category_path(@proverb.category.id) and return
    end
    if @proverb.text.length != params[:text].length
      flash[:error] = "Too slow!  Someone has already added a word. Try again!"
      redirect_to category_path(@proverb.category.id) and return
    end
    word = word.split(' ').first
    @proverb.proverb_words.create(:user_id=>@current_user.id, :word=>word)
    @proverb.complete if word[-1] == 46
    redirect_to category_path(@proverb.category.id)
  end
  
  
end

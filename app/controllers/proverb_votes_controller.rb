class ProverbVotesController < FacebookBaseController
  def create
    @proverb = Proverb.find(params[:proverb_id])
    unless @proverb.proverb_votes.size > 0 and @proverb.proverb_votes.find_by_user_id(@current_user.id) and (params[:score] == 1 or params[:score] == -1)
      @proverb.proverb_votes.create(:score=>params[:score], :user_id=>@current_user.id)
      if params[:score] == 1
        @proverb.users.each{|u|
          u.update_attribute(:score, u.score + 1)
          }
      end
    end
    render :text=>Proverb.find(params[:proverb_id]).score
  end
  
  
end

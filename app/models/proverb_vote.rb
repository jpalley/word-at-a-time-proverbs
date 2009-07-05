class ProverbVote < ActiveRecord::Base
  belongs_to :proverb
  
  def after_create
    self.proverb.update_attribute(:score, self.proverb.score + self.score)
    
    self.proverb.users
  end
end

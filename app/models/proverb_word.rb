class ProverbWord < ActiveRecord::Base
  belongs_to :proverb
  belongs_to :user
  
  def after_create
    self.proverb.update_attribute(:text, self.proverb.text + " #{self.word}")
  end
end

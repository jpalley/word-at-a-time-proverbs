class Proverb < ActiveRecord::Base
  belongs_to :category
  has_many :proverb_words, :dependent=>:destroy
  has_many :proverb_votes, :dependent=>:destroy
  has_many :users, :through=>:proverb_words, :uniq=>true
  
  def after_create
    self.category.update_attribute(:proverb_count, self.category.proverb_count + 1)
  end
  
  def complete
    self.category.proverbs.create(:started_at=>Time.now.utc, :text=>'', :score=>0)
    self.update_attributes(:completed_at=>Time.now.utc)
  end
end

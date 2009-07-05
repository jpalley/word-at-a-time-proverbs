class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :proverbs, :dependent=>:destroy
  has_many :category_subscribers, :dependent=>:destroy
  has_many :users, :through=>:category_subscribers
  belongs_to :creator, :foreign_key=>'creator_id', :class_name=>'User'
  def first_word
    return '' if new_record?
  end
end

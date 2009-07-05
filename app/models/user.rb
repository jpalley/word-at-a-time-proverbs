class User < ActiveRecord::Base
  has_many :proverb_words
  has_many :proverbs, :through=>:proverb_words
end

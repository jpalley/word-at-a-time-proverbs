class User < ActiveRecord::Base
  has_many :proverb_words
end

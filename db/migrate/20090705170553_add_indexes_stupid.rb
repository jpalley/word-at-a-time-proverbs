class AddIndexesStupid < ActiveRecord::Migration
  def self.up
    add_index :users, :uid
    add_index :proverbs, :category_id
    add_index :proverb_words, :user_id
    add_index :proverb_words, :proverb_id
    add_index :proverb_votes, :proverb_id
    add_index :proverb_votes, :user_id
    add_index :category_subscribers, :category_id
    add_index :category_subscribers, :user_id
  end

  def self.down
    remove_index :category_subscribers, :user_id
    remove_index :category_subscribers, :category_id
    remove_index :proverb_votes, :user_id
    remove_index :proverb_votes, :proverb_id
    remove_index :proverb_words, :proverb_id
    remove_index :proverb_words, :user_id
    remove_index :proverbs, :category_id
    remove_index :users, :uid
  end
end

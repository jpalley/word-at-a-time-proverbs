class AddProverbCountToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :proverb_count, :integer, :default => 0
  end

  def self.down
    remove_column :categories, :proverb_count
  end
end

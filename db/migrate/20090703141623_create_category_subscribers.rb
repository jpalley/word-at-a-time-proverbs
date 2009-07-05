class CreateCategorySubscribers < ActiveRecord::Migration
  def self.up
    create_table :category_subscribers do |t|
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_subscribers
  end
end

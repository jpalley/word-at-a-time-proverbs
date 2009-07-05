class CreateProverbWords < ActiveRecord::Migration
  def self.up
    create_table :proverb_words do |t|
      t.string :word
      t.integer :user_id
      t.integer :proverb_id

      t.timestamps
    end
  end

  def self.down
    drop_table :proverb_words
  end
end

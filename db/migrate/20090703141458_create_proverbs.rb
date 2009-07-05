class CreateProverbs < ActiveRecord::Migration
  def self.up
    create_table :proverbs do |t|
      t.timestamp :started_at
      t.timestamp :completed_at
      t.integer :score
      t.integer :category_id
      t.string :text
      t.timestamps
    end
  end

  def self.down
    drop_table :proverbs
  end
end

class CreateProverbs < ActiveRecord::Migration
  def self.up
    create_table :proverbs do |t|
      t.timestamp :started_at
      t.timestamp :completed_at
      t.integer :score, :default=>0
      t.integer :category_id
      t.string :text, :default=>''
      t.timestamps
    end
  end

  def self.down
    drop_table :proverbs
  end
end

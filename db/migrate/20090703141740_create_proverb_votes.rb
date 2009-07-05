class CreateProverbVotes < ActiveRecord::Migration
  def self.up
    create_table :proverb_votes do |t|
      t.integer :user_id
      t.integer :score
      t.integer :proverb_id

      t.timestamps
    end
  end

  def self.down
    drop_table :proverb_votes
  end
end

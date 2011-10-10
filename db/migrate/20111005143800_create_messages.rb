class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :friend_id
      t.text :messagetext

      t.timestamps
    end
  end
end

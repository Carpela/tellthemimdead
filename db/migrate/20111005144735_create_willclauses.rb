class CreateWillclauses < ActiveRecord::Migration
  def change
    create_table :willclauses do |t|
      t.integer :will_id
      t.integer :friend_id
      t.integer :stuff_id

      t.timestamps
    end
  end
end

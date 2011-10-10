class CreateWills < ActiveRecord::Migration
  def change
    create_table :wills do |t|
      t.integer :user_id
      t.datetime :datesigned

      t.timestamps
    end
  end
end

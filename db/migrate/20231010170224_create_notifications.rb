class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id

      t.timestamps
    end
  end
end

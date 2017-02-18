class CreateRoomUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :room_users do |t|
      t.integer :room_id
      t.integer :player_id

      t.timestamps
    end
  end
end

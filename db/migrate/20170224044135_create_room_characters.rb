class CreateRoomCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :room_characters do |t|
      t.integer :player_id
      t.integer :room_id

      t.timestamps
    end
  end
end

class AddGmNameToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :gm_name, :string
  end
end

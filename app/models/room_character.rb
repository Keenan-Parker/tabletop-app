class RoomCharacter < ApplicationRecord
  belongs_to :player, class_name: "Character", foreign_key: "player_id"
  belongs_to :campaign, class_name: "Room", foreign_key: "room_id"
end

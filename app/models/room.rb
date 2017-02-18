class Room < ApplicationRecord
  belongs_to :user
  has_many :players, class_name: "RoomUser", foreign_key: "player_id"
end

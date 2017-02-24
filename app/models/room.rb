class Room < ApplicationRecord
  belongs_to :user
  has_many :players, class_name: "RoomCharacter", foreign_key: "room_id"

  validates :name, :password, :gm_name, presence: true
end

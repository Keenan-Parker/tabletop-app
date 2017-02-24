class Character < ApplicationRecord
   belongs_to :user
   has_many :items, dependent: :destroy
   has_many :campaigns, class_name: "RoomCharacter", foreign_key: "player_id"

   validates :name, :job, :level, presence: true

   def stat_mod(stat)
     stat / 2 - 5
   end
end

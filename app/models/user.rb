class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

          has_many :characters
          has_many :rooms
          has_many :campaigns, class_name: "RoomUser", foreign_key: "player_id"
end

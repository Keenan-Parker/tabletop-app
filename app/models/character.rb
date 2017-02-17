class Character < ApplicationRecord
   belongs_to :user
   has_many :items

   def stat_mod(stat)
     stat / 2 - 5
   end
end

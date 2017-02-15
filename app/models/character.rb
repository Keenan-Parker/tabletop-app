class Character < ApplicationRecord
   belongs_to :user

   def stat_mod(stat)
     stat / 2 - 5
   end
end

class Item < ApplicationRecord
   # model association
   belongs_to :citrakara

   # validation
   validates_presence_of :name
end

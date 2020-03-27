class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  
  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  # enum buyer_id:{"売り切れ": 1, "販売中": 0}

end
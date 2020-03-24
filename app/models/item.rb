class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  
  # activehash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :statushash
  belongs_to_active_hash :feehash


end

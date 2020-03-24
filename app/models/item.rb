class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :statushash


end

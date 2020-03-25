class Item < ApplicationRecord
  # belongs_to :user
  belongs_to :category
  has_many :images
  
  # 親と子同時削除
  accepts_nested_attributes_for :images, allow_destroy: true
  
  # activehash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :statushash
  belongs_to_active_hash :feehash
  belongs_to_active_hash :shippinghash



end

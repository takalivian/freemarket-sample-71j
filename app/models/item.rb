class Item < ApplicationRecord

  belongs_to :category
  has_many :images, dependent: :destroy
  validates :images, :name,:text, :status, :fee, :prefecture_id, :shipping, :price, presence: true
  

  accepts_nested_attributes_for :images, allow_destroy: true
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :statushash
  belongs_to_active_hash :feehash
  belongs_to_active_hash :shippinghash

end

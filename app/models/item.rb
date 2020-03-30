class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  # 出品登録の為
  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  validates :images, :name,:text, :status, :fee, :prefecture_id, :shipping, :price, presence: true
  
  # 親と子同時削除
  accepts_nested_attributes_for :images, allow_destroy: true
  
  # activehash
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :statushash
  belongs_to_active_hash :feehash
  belongs_to_active_hash :shippinghash

end

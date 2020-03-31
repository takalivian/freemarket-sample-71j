class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, :password, :first_name, :last_name, :birthday, :first_name_kana, :last_name_kana,
            :send_first_name, :send_last_name, :send_first_name_kana, :send_last_name_kana, presence: true
  validates :nickname, uniqueness: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, length: { minimum: 7 }
  has_many :items
  has_many :cards
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_one :address
  accepts_nested_attributes_for :address

end

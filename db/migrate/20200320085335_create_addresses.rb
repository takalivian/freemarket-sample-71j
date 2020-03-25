class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :postalcode
      t.integer :prefecture
      t.string  :city_town
      t.string  :building_name
      # t.integer :prefecture_id
      # t.string  :city
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end

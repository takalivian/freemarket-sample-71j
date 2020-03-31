class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :postalcode,   null: false
      t.integer :prefecture,   null: false, default: 0
      t.string  :city_town,    null: false
      t.string  :house_number, null: false
      t.string  :building_name
      t.string  :phone_number
      t.references :user
      t.timestamps
    end
  end
end

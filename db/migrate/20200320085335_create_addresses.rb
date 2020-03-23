class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :postalcode,   null: false
      t.integer :prefecture,   null: false
      t.string  :city_town,    null: false
      t.string  :building_name, null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end

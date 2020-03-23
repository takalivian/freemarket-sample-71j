class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.text   :text,            null: false
      t.integer :status,         null: false
      t.integer :fee,            null: false
      t.string  :area,           null: false
      t.date    :shipping_date,  null: false
      t.integer :price,          null: false
      t.references :user,        null: false, foreign_key: true
      t.references :category,    null: false, foreign_key: true
      t.timestamps
    end


    add_index :items, :name,               unique: true

  end
end

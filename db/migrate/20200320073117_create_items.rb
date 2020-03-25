class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text   :text
      t.integer :status
      t.string :brand
      t.integer :fee
      t.integer  :prefecture_id
      t.integer    :shipping
      t.integer :price
      t.references :user,        foreign_key: true
      t.references :category,   foreign_key: true
      t.timestamps
    end


  end
end

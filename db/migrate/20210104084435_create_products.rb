class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active, default: true
      t.string :image_id

      t.timestamps
    end
  end
end

class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.integer :status, default: 0
      t.integer :purchase_price

      t.timestamps
    end
  end
end

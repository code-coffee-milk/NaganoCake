class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :method_of_payment
      t.string :shipping_name
      t.string :shipping_postal_code
      t.string :shipping_street_adress
      t.integer :total_payment
      t.integer :status, default: 0
      
      

      t.timestamps
    end
  end
end

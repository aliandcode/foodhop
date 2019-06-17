class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.string :qr_code
      t.string :dishes_portion
      t.references :dish_availability, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

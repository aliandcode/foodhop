class CreateDishAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_availabilities do |t|
      t.date :date
      t.string :portion_available
      t.string :address
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end

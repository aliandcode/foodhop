class AddPriceToDishAvailabilities < ActiveRecord::Migration[5.2]
  def change
    add_column :dish_availabilities, :price, :integer
  end
end

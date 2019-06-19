class AddAllergensToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :allergens, :text
  end
end

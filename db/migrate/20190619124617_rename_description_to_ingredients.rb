class RenameDescriptionToIngredients < ActiveRecord::Migration[5.2]
  def change
    rename_column :dishes, :description, :ingredients
  end
end

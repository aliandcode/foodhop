class AddCuisineToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :cuisine, :text, array: true, default: []
  end
end

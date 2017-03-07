class RenameColumnToSuppliers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :suppliers, :comunne, :commune
  end
end

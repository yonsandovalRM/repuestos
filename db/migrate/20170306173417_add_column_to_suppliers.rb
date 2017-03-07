class AddColumnToSuppliers < ActiveRecord::Migration[5.0]
  def change
	  add_column :suppliers, :email, :string
	end
end

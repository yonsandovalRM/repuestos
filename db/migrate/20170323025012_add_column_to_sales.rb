class AddColumnToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :date_doc, :datetime
  end
end

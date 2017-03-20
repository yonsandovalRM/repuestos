class ChangeStockToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :stock, :float
    change_column :articles, :stock_store, :float
    change_column :articles, :stock_min, :float

    change_column :purchase_details, :stock, :float
    change_column :purchase_details, :stock_store, :float

    change_column :quotation_details, :stock, :float
    
    change_column :sale_details, :stock, :float
    change_column :sale_details, :stock_store, :float
  end

end

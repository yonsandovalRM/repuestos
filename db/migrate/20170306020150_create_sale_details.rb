class CreateSaleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_details do |t|
      t.references :article, foreign_key: true
      t.integer :stock
      t.integer :stock_store
      t.integer :pou
      t.integer :discount
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end

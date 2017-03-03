class CreatePurchaseDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :purchase_details do |t|
      t.references :article, foreign_key: true
      t.integer :stock
      t.integer :stock_store
      t.integer :pin
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end

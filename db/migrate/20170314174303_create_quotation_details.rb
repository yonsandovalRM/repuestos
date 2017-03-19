class CreateQuotationDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :quotation_details do |t|
      t.references :article, foreign_key: true
      t.integer :stock
      t.integer :pou
      t.integer :discount
      t.references :quotation, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :supplier, foreign_key: true
      t.string :number_doc
      t.references :type_document, foreign_key: true
      t.datetime :date_doc
      t.string :observation
      t.string :status

      t.timestamps
    end
  end
end

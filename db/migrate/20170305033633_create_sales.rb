class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.references :user, foreign_key: true
      t.references :payment_method, foreign_key: true
      t.string :number_doc
      t.references :type_document, foreign_key: true
      t.references :status_payment, foreign_key: true
      t.string :observation
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end

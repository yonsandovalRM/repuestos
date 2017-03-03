class AddColumnToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :payment_method, foreign_key: true
    add_column :purchases, :status_payment, :string
  end
end

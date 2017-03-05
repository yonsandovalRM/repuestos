class AddColumnStatusPaymentToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_reference :purchases, :status_payment, foreign_key: true
  end
end

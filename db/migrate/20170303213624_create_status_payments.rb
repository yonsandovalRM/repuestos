class CreateStatusPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :status_payments do |t|
      t.string :name

      t.timestamps
    end
  end
end

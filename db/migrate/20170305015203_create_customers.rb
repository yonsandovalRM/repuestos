class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :observation
      t.string :run
      t.string :name
      t.string :address
      t.string :commune
      t.string :city
      t.string :phone
      t.string :phone2
      t.string :email
      t.string :status
      t.string :b_rut
      t.string :b_name
      t.string :b_address
      t.string :b_commune
      t.string :b_activity
      t.string :b_phone
      t.string :b_email

      t.timestamps
    end
  end
end

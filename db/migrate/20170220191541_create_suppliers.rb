class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :rut
      t.string :bname
      t.string :address
      t.string :comunne
      t.string :city
      t.string :activity
      t.string :phone
      t.boolean :status

      t.timestamps
    end
  end
end

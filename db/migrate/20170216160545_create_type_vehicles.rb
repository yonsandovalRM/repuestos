class CreateTypeVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :type_vehicles do |t|
      t.string :name

      t.timestamps
    end
  end
end

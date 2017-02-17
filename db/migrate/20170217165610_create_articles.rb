class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :code
      t.string :description
      t.references :brand, foreign_key: true
      t.references :type_article, foreign_key: true
      t.references :type_vehicle, foreign_key: true
      t.references :type_format, foreign_key: true
      t.boolean :status
      t.string :applicant
      t.integer :pin
      t.integer :pou
      t.integer :discount
      t.integer :stock
      t.integer :stock_store
      t.integer :stock_min

      t.timestamps
    end
  end
end

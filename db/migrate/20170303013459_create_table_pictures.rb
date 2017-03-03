class CreateTablePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :article, foreign_key: true
    end
  end
end

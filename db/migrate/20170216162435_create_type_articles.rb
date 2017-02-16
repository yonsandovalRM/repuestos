class CreateTypeArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :type_articles do |t|
      t.string :name

      t.timestamps
    end
  end
end

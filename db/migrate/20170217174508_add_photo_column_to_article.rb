class AddPhotoColumnToArticle < ActiveRecord::Migration[5.0]
  def up
    add_attachment :articles, :photo
  end
  def down
    remove_attachment :articles, :photo
  end
end

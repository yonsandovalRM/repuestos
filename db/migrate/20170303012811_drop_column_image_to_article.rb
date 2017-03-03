class DropColumnImageToArticle < ActiveRecord::Migration[5.0]
  def change
  	remove_column :articles, :photo_file_name
    remove_column :articles, :photo_content_type
    remove_column :articles, :photo_file_size
    remove_column :articles, :photo_updated_at
  end
end

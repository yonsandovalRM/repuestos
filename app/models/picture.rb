# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  article_id         :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_pictures_on_article_id  (article_id)
#

class Picture < ApplicationRecord
	has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/placeholder.jpg"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  	belongs_to :article
end

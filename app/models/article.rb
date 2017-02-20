class Article < ApplicationRecord
  has_attached_file :photo, styles: { medium: "500x500>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  
  belongs_to :brand
  belongs_to :type_article
  belongs_to :type_vehicle
  belongs_to :type_format
end

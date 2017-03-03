class Article < ApplicationRecord
  acts_as_paranoid
  has_attached_file :photo, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/placeholder.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates :description, :code, :brand, :pin, :pou, presence: true
  belongs_to :brand
  belongs_to :type_article
  belongs_to :type_vehicle
  has_many   :purchase_details
  belongs_to :type_format

  def self.total_active
  	Article.where('status = true').count
	end

end

class Article < ApplicationRecord
  acts_as_paranoid
 
  validates  :description, :code, :brand, :pin, :pou, presence: true
  belongs_to :brand
  belongs_to :type_article
  belongs_to :type_vehicle
  has_many   :purchase_details
  belongs_to :type_format
  has_many   :pictures, :dependent => :destroy

  def self.total_active
  	Article.where('status = true').count
	end

end

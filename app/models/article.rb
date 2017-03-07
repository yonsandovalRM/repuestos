class Article < ApplicationRecord
  acts_as_paranoid
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tags
 
  validates  :description, :code, :brand, :pin, :pou, presence: true
  belongs_to :brand
  belongs_to :type_article
  belongs_to :type_vehicle
  has_many   :purchase_details
  has_many   :sale_details
  belongs_to :type_format
  has_many   :pictures, :dependent => :destroy

  def self.total_active
  	Article.where('status = true').count
	end

end

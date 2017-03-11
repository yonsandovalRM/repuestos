# == Schema Information
#
# Table name: articles
#
#  id              :integer          not null, primary key
#  code            :string
#  description     :string
#  brand_id        :integer
#  type_article_id :integer
#  type_vehicle_id :integer
#  type_format_id  :integer
#  status          :boolean
#  applicant       :string
#  pin             :integer
#  pou             :integer
#  discount        :integer
#  stock           :integer
#  stock_store     :integer
#  stock_min       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deleted_at      :datetime
#
# Indexes
#
#  index_articles_on_brand_id         (brand_id)
#  index_articles_on_deleted_at       (deleted_at)
#  index_articles_on_type_article_id  (type_article_id)
#  index_articles_on_type_format_id   (type_format_id)
#  index_articles_on_type_vehicle_id  (type_vehicle_id)
#

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

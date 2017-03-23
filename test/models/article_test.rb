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
#  stock           :float
#  stock_store     :float
#  stock_min       :float
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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

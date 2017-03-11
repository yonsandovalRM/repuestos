# == Schema Information
#
# Table name: sale_details
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  stock       :integer
#  stock_store :integer
#  pou         :integer
#  discount    :integer
#  sale_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sale_details_on_article_id  (article_id)
#  index_sale_details_on_sale_id     (sale_id)
#

require 'test_helper'

class SaleDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

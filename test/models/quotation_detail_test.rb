# == Schema Information
#
# Table name: quotation_details
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  stock        :integer
#  pou          :integer
#  discount     :integer
#  quotation_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_quotation_details_on_article_id    (article_id)
#  index_quotation_details_on_quotation_id  (quotation_id)
#

require 'test_helper'

class QuotationDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

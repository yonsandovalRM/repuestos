# == Schema Information
#
# Table name: quotation_details
#
#  id           :integer          not null, primary key
#  article_id   :integer
#  stock        :float
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

class QuotationDetail < ApplicationRecord
  belongs_to :article
  belongs_to :quotation
end

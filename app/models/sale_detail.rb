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

class SaleDetail < ApplicationRecord
  validates :article_id, :sale_id, :pou, presence: true
  belongs_to :article
  belongs_to :sale
end

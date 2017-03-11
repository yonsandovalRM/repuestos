# == Schema Information
#
# Table name: purchase_details
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  stock       :integer
#  stock_store :integer
#  pin         :integer
#  purchase_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_purchase_details_on_article_id   (article_id)
#  index_purchase_details_on_purchase_id  (purchase_id)
#

class PurchaseDetail < ApplicationRecord
  belongs_to :article
  belongs_to :purchase
  
end

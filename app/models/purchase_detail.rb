class PurchaseDetail < ApplicationRecord
  belongs_to :article
  belongs_to :purchase
end

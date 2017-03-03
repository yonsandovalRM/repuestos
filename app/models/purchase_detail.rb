class PurchaseDetail < ApplicationRecord
  belongs_to :article
  belongs_to :purchase, :dependent => :destroy
  
end

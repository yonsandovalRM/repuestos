class SaleDetail < ApplicationRecord
  belongs_to :article
  belongs_to :sale
end

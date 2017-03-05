class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :payment_method
  belongs_to :type_document
  belongs_to :status_payment
  belongs_to :customer
  def self.total_active
  	Sale.all.count
  end
end

# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  rut        :string
#  bname      :string
#  address    :string
#  commune    :string
#  city       :string
#  activity   :string
#  phone      :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#

class Supplier < ApplicationRecord
  	validates :rut, rut: true
  	has_many :purchases

	def self.total_active
	  	Supplier.where('status = true').count
	end
end

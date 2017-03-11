# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  run        :string
#  name       :string
#  address    :string
#  commune    :string
#  city       :string
#  phone      :string
#  phone2     :string
#  email      :string
#  status     :string
#  b_rut      :string
#  b_name     :string
#  b_address  :string
#  b_commune  :string
#  b_activity :string
#  b_phone    :string
#  b_email    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
	validates :run, rut: true
	validates :b_rut, rut: true, if: 'b_rut.present?'
	has_many  :sale

	def self.total_active
	  	Customer.all.count
	end
end

# == Schema Information
#
# Table name: type_vehicles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypeVehicle < ApplicationRecord
	validates :name, uniqueness: true
end

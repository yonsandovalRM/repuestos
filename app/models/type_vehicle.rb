class TypeVehicle < ApplicationRecord
	validates :name, uniqueness: true
end

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

require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

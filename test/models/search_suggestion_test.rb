# == Schema Information
#
# Table name: search_suggestions
#
#  id         :integer          not null, primary key
#  term       :string
#  popularity :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SearchSuggestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

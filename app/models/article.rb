class Article < ApplicationRecord
  belongs_to :brand
  belongs_to :type_article
  belongs_to :type_vehicle
  belongs_to :type_format
end

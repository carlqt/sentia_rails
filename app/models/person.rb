class Person < ApplicationRecord
  has_many :locations
  has_many :affiliations
end

class Person < ApplicationRecord
  has_many :person_locations
  has_many :locations, through: :person_locations
  has_many :affiliations

  validates :first_name, presence: true
end

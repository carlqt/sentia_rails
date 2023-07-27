class Person < ApplicationRecord
  has_many :person_locations
  has_many :locations, through: :person_locations

  has_many :person_affiliations
  has_many :affiliations, through: :person_affiliations

  validates :first_name, presence: true
end

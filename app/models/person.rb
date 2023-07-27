class Person < ApplicationRecord
  has_many :locations
  has_many :affiliations

  validates :first_name, presence: true
end

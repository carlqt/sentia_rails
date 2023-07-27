class Location < ApplicationRecord
  has_many :person, through: :person_locations
  has_many :person_locations

  before_save :titleize_name

  def titleize_name
    self.name = name.titleize
  end
end

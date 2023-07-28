class Location < ApplicationRecord
  include Queryable
  paginates_per 10

  has_many :person, through: :person_locations
  has_many :person_locations

  before_save :titleize_name

  def titleize_name
    self.name = name&.titleize
  end
end

class Affiliation < ApplicationRecord
  has_many :person, through: :person_affiliations
  has_many :person_affiliations

  before_save :titleize_name

  def titleize_name
    self.name = name&.titleize
  end
end

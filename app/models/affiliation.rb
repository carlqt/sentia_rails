class Affiliation < ApplicationRecord
  has_many :person, through: :person_affiliations
  has_many :person_affiliations
end

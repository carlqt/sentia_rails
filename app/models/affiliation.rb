class Affiliation < ApplicationRecord
  include Queryable
  paginates_per 10

  has_many :person, through: :person_affiliations
  has_many :person_affiliations
end

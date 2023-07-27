class Person < ApplicationRecord
  has_many :person_locations
  has_many :locations, through: :person_locations

  has_many :person_affiliations
  has_many :affiliations, through: :person_affiliations

  validates :first_name, presence: true

  before_save :titleize_name

  def titleize_name
    if first_name.present?
      self.first_name = first_name.split(' ').map(&:upcase_first).join(' ')
    end

    if last_name.present?
      self.last_name = last_name.split(' ').map(&:upcase_first).join(' ')
    end
  end
end

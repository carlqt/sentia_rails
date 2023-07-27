class Affiliation < ApplicationRecord
  belongs_to :person

  before_save :titleize_name

  def titleize_name
    self.name = name.titleize
  end
end

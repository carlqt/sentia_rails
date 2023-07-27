class Importer
  def initialize(file)
    @file = file.open
    @data_list = []
  end

  def run
    @csv.each do |row|
      next if row[:Affiliations].blank?

      person = build_person(row)
      locations = build_location(row)
      affiliations = build_affiliation(row)

      @data_list << { person: person, locations: locations, affiliations: affilications }
    end

    @data_list.each do |data|
      insert_to_db!(data)
    end
  end

  def insert_to_db!
  end

  def build_person(row)
    Person.new.tap do |person|
      person.name: row[:Name]
      person.species = row[:Species]
      person.gender = row[:Gender]
      person.weapon = row[:Weapon]
      person.vehicle = row[:Vehicle]
    end
  end

  def build_location(row)
    locations_row = row[:Location].split(',')

    locations_row.map do |loc_name|
      Location.new(name: loc_name)
    end
  end

  def build_affiliation(row)
    affiliations_row = row[:Location].split(',')

    affiliations_row.map do |aff_name|
      Affiliation.new(name: aff_name)
    end
  end

  def csv
    @csv ||= CSV.parse(@file, headers: true)
  end
end
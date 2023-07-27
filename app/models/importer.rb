require 'csv'

class Importer
  def initialize(file)
    @file = file.open
    @data_list = []
  end

  def run
    csv.each do |row|
      next if row['Affiliations'].blank?

      person = build_person(row)
      locations = build_location(row)
      affiliations = build_affiliation(row)

      @data_list << { person: person, locations: locations, affiliations: affiliations }
    end

    @data_list.each do |data|
      insert_to_db!(data)
    end
  end

  def insert_to_db!(data)
    person = data[:person]

    locations = data[:locations].map do |l|
      Location.find_or_create_by(name: l)
    end

    affiliations = data[:affiliations].map do |a|
      Affiliation.find_or_create_by(name: a) 
    end

    person.save

    person.locations << locations
    person.affiliations << affiliations
  end

  def build_person(row)
    Person.new.tap do |person|
      person.first_name = row['Name']
      person.species = row['Species']
      person.gender = row['Gender']
      person.weapon = row['Weapon']
      person.vehicle = row['Vehicle']
    end
  end

  def build_location(row)
    locations_row = row['Location'].split(',')

    locations_row.map { |loc_name| loc_name }
  end

  def build_affiliation(row)
    affiliations_row = row['Affiliations'].split(',')

    affiliations_row.map { |aff_name| aff_name }
  end

  def csv
    @csv ||= CSV.parse(@file, headers: true)
  end
end
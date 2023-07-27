require'csv'

class Importer
  attr_reader :errors

  def initialize(file)
    @file = file&.open
    @data_list = []
    @errors = {}
  end

  def run
    # refactor
    if @file.blank?
      @errors = ['No file detected']
      return
    end

    CSV.foreach(@file, headers: true).with_index do |row, index|
      next if row['Affiliations'].blank?

      person = build_person(row)
      locations = build_location(row)
      affiliations = build_affiliation(row)

      row = index + 2
      @data_list << { person: person, locations: locations, affiliations: affiliations, row: row }
    end

    @data_list.each do |data|
      insert_to_db!(data)
    end
  end

  def insert_to_db!(data)
    person = data[:person]

    ActiveRecord::Base.transaction do
      locations = data[:locations].map do |l|
        Location.find_or_create_by!(name: l.titleize)
      end

      affiliations = data[:affiliations].map do |a|
        Affiliation.find_or_create_by!(name: a.titleize)
      end

      person.locations = locations
      person.affiliations = affiliations
      person.save!
    end

  rescue ActiveRecord::RecordInvalid => invalid
    row_number = data[:row]

    errors[row_number] = invalid.record.errors.full_messages
  end

  def build_person(row)
    Person.new.tap do |person|
      first_name, last_name = row['Name'].split(' ', 2)

      person.first_name = first_name
      person.last_name = last_name
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
end
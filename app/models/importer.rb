class Importer
  def initialize(file)
    @file = file.open
  end

  def run
  end

  def csv
    @csv ||= CSV.parse(@file, headers: true)
  end
end
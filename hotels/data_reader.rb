class DataReader
  def initialize
    @hotels = {}
  end

  def read_data_from(file_name)
    CSV.foreach(file_name, {headers: true}) do |row|
      name = as_pretty_string(row["Hotel"])
      populate_database(name, row)
    end
    @hotels
  end

  private

  def as_pretty_string(value)
    value.strip
  end

  def populate_database(name, row)
    hotel = Hotel.new(row)
    @hotels[name] = hotel
  end
end

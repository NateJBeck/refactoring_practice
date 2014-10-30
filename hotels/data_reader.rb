class DataReader
  def initialize
    @hotels = {}
  end

  def read_data_from(file_name)
    CSV.foreach(file_name, {headers: true}) do |row|
      name = row["Hotel"]
      populate_database(name, row)
    end
    @hotels
  end

  private

  def populate_database(name, row)
    hotel = Hotel.new(row)
    @hotels[name] = hotel
  end
end

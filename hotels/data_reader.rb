require "csv"

class DataReader
  def initialize
    @hotels = {}
    @hotel_names = []
  end

  def read_data_from(file_name)
    CSV.foreach(file_name, {headers: true}) do |row|
      name = row["Hotel"]
      @hotels[name] = {
        city: row["City"],
        phone: row["Phone Number"],
        singles: row["Number of Singles"],
        doubles: row["Number of Doubles"]
      }
    end
    @hotels
  end
end

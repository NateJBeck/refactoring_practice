require "csv"

class DataReader
  def read_data_from(file_name)
    hotel_name = []

    CSV.foreach(file_name, {headers: true}) do |row|
      hotel_name << row["Hotel"]
    end

    hotel_name
  end
end

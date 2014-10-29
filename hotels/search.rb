require "./data_reader.rb"

class Search
  def get_csv_data
    data_reader = DataReader.new
    hotel_name = data_reader.read_data_from("hotels.csv")
    puts hotel_name
  end

end

search = Search.new
search.get_csv_data

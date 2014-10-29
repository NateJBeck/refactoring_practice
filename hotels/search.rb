require "./data_reader.rb"

class Search
  def get_csv_data
    data_reader = DataReader.new
    @hotel_information = data_reader.read_data_from("hotels.csv")
  end

  def search
    print "Enter hotel name > "
    search = gets.chomp
    puts @hotel_information[search][:city]
    puts @hotel_information[search][:phone]
    puts @hotel_information[search][:singles]
    puts @hotel_information[search][:doubles]
  end
end

search = Search.new
search.get_csv_data
search.search

require "csv"

require "./data_reader.rb"
require "./hotel.rb"
require "./null_hotel.rb"
require "./parser.rb"

class Search
  def get_csv_data
    data_reader = DataReader.new
    @hotel_database = data_reader.read_data_from("hotels.csv")
  end

  def search
    desired_hotel_name = ask_user_for_desired_hotel
    print_hotel_information(desired_hotel_name)
  end

  private

  def ask_user_for_desired_hotel
    print "Enter Hotel Name >> "
    gets.chomp
  end

  def print_hotel_information(desired_hotel_name)
    hotel = @hotel_database.fetch(desired_hotel_name, NullHotel.new)
    hotel.print_information
  end
end

search = Search.new
search.get_csv_data
search.search

class Hotel
  def initialize(row)
     @info = {
       city: row["City"],
       phone: row["Phone Number"],
       singles: row["Number of Singles"],
       doubles: row["Number of Doubles"]
     }
  end

  def print_information
    parser = Listing.new(@info)
    parser.print_hotel_data
  end
end

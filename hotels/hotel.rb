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
    puts "City: #{@info[:city]}"
    puts "Phone Number: #{@info[:phone]}"
    puts "Total Rooms: #{total_rooms}"
  end

  private

  def total_rooms
    as_integer(@info[:singles]) + as_integer(@info[:doubles])
  end

  def as_integer(value)
    value.gsub(",", "").to_i
  end

  def as_pretty_string(value)
    value.strip
  end
end

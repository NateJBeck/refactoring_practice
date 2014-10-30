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
    puts "Singles: #{@info[:singles]}"
    puts "Doubles: #{@info[:doubles]}"
  end
end

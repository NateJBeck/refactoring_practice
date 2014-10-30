class Listing
  def initialize(info)
    @info = info
  end

  def print_hotel_data
    puts "City: #{as_pretty_string(@info[:city])}"
    puts "Phone Number: #{as_pretty_phone_number(@info[:phone])}"
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

  def as_pretty_phone_number(phone)
    bad_number = @info[:phone]
    pattern = /(\d{2})?\(?(\d{3})\)?[-.]?(\d{3})[-.]?(\d{4})/
    match = pattern.match(bad_number)
    "+#{match[1] || 1} (#{match[2]}) #{match[3]}-#{match[4]}"
  end
end

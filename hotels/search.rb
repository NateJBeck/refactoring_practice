class Search
  def find_properties
    read_data
    store_data_into_arrays
    
  end
end

search = Search.new
search.find_properties

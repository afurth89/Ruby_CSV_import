require "csv"

data = Array.new

CSV.foreach("./lib/seeds/SalesJan2009.csv", 
  { 
    encoding: "UTF-8", 
    headers: true,
    header_converters: :symbol,
    converters: :all
  }
) do |row|
  data << row.to_hash
end

puts data
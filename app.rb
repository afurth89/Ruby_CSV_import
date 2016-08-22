require 'csv'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'

data = CSV.read("./data/SalesJan2009.csv", 
  { 
    encoding: "UTF-8", 
    headers: true,
    header_converters: :symbol,
    converters: :all
  }
)

hashed_data = data.map { |d| d.to_hash }

get "/" do
  @transactions = hashed_data
  erb :"transactions/index"
  # "Hello World"
end
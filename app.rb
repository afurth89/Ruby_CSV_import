require 'csv'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Transaction < ActiveRecord::Base
end

# data = Array.new

# CSV.foreach("./data/SalesJan2009.csv", 
#   { 
#     encoding: "UTF-8", 
#     headers: true,
#     header_converters: :symbol,
#     converters: :all
#   }
# ) do |row|
#   data << row.to_hash
# end

get "/" do
  @transactions = data
  erb :"transactions/index"
  # "Hello World"
end
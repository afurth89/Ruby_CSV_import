require 'csv' 
require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Transaction < ActiveRecord::Base
end

# ALL transactions
get "/" do
  @transactions = Transaction.all
  # Transaction.find_each do |transaction|
  #   @transactions << transaction.to_hash
  # end
  erb :"transactions/index"
end

#BY PRODUCT
get "/products/:product" do
  T
end
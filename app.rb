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
  @transactions = Transaction.where('product = ?', params[:product])
  erb :"transactions/by_product/Product1"
end
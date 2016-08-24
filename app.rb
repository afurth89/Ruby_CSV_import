require 'csv' 
require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Transaction < ActiveRecord::Base
end

helpers do
  def title
    if @title
      "All Transactions #{@title}"
    else
      "All Transactions"
    end
  end
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
  @title = "for " + params[:product]
  erb :"transactions/index"
end
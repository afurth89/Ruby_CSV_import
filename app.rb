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
  @column_overview = Transaction.group('product').count
  @transactions = Transaction.where('product = ?', params[:product])
  @title = "for " + params[:product]
  erb :"transactions/index"
end

#BY PAYMENT TYPE
get "/payment/:type" do
  @column_overview = Transaction.group('payment_type').count
  @transactions = Transaction.where('payment_type = ?', params[:type])
  @title = "for " + params[:type] + "cards"
  erb :"transactions/index"
end

# All transactions over $1200
get "/scenario/1" do
  @transactions = Transaction.where('price > ?', 1200)
  @title = "above $1200"
  erb :"transactions/index"
end


# All transactions from France who used a Visa card

# All transactions that have a transaction date

# All transactions that aren't missing any dates

# All transactions made by someone who made multiple transactions
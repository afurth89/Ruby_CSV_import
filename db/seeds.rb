# WHY YOU SHOULD MANUALLY RESET DB
# (instead of writing command in seed)
# http://stackoverflow.com/questions/6985222/how-to-clear-whole-database-in-rails-seeds-rb

# First of all, I don't think it's a good idea to mix 
# oncerns like this. The seeds.rb file is intended to 
# seed the database with data, not reset it. There is 
# already a rake task for resetting a database 
# (rake db:migrate:reset) that just runs 
# rake db:drop db:create db:migrate. 
# If you're wanting to seed a fresh database, you can
# just run rake db:reset db:seed.

require 'csv'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'

class Transaction < ActiveRecord::Base
end

CSV.foreach("./lib/seeds/SalesJan2009.csv", 
  { 
    encoding: "UTF-8", 
    headers: true,
    header_converters: :symbol,
    converters: :all
  }
) do |row|
  row = row.to_hash
  t = Transaction.new
  t.transaction_date = row[:transaction_date]
  t.product = row[:product]
  t.price = row[:price]
  t.payment_type = row[:payment_type]
  t.name = row[:name]
  t.city = row[:city]
  t.state = row[:state]
  t.country = row[:country]
  t.account_created = row[:account_created]
  t.last_login = row[:last_login]
  t.save
  puts "#{t.name}'s purchase for #{t.price} saved"
end

puts "There are now #{Transaction.count} rows in the transaction table"
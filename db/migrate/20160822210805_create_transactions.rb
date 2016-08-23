class CreateTransactions < ActiveRecord::Migration
  def self.up 
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.string :product
      t.integer :price
      t.string :payment_type
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.datetime :account_created
      t.datetime :last_login
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end

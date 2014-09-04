require 'CSV'
require 'pry'
require_relative 'transaction.rb'
require_relative 'account.rb'

def import_csv(filename)
  data = []
  CSV.foreach(filename, headers:true) do |row|
    data << row.to_hash
  end
  data
end

#based on what account you require, return the info of that account
def account(account_name)
  balance_data = import_csv('balances.csv')
  balance_data.each do |balance|
    if balance['Account'] == account_name
      return balance
    end
  end
end

def trans(account_name)
bank_data = import_csv('bank_data.csv')
  bank_data.each do |transaction_info|
    if transaction_info['Account'] == account_name
      transaction_summary = Transaction.new(transaction_info)
      puts "#{transaction_summary.summary}"
    end
  end
end

puts '==== Purchasing Account ==== '
account_info = account('Purchasing Account')
account_summary = Account.new(account_info)
puts "Starting Balance:#{account_summary.starting_balance}"
puts "Ending Balance: #{account_summary.current_balance}"

#transaction info
trans('Purchasing Account')



puts '==== Business Checking ==== '
account_info = account('Business Checking')
account_summary = Account.new(account_info)
puts "Starting Balance:#{account_summary.starting_balance}"
puts "Ending Balance: #{account_summary.current_balance}"

trans('Business Checking')





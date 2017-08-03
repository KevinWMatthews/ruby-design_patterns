#!/usr/bin/env ruby

require_relative '../src/enumerable.rb'

account1 = Account.new('Fantasy Kevin', 'infinite')
account2 = Account.new('Real Kevin', 'very finite')

portfolio = Portfolio.new
portfolio.add_account(account1)
portfolio.add_account(account2)
portfolio.each do |account|
  puts "'#{account.name}' has '#{account.balance}' finances."
end

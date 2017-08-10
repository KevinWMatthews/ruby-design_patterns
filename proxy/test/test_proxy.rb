#!/usr/bin/env ruby

require_relative '../src/proxy.rb'

puts 'Demonstrate a simple proxy:'
account = BankAccountProxy.new(BankAccount.new)
puts account.balance
account.deposit(42)
puts account.balance
account.withdraw(66)
puts account.balance

puts
puts 'Demonstrate a proxy that processes requests:'
account = AccountProtectionProxy.new(BankAccount.new(1234), 'kmatthews')  # change from kmatthews for failure
puts account.balance

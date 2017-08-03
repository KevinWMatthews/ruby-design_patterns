# The most Ruby-esque way to create an iterator is to mix in the Ruby Enumerable class.

# This is an individual object.
class Account
  attr_accessor :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  # The individual object must provide a general comparison operator:
  # like strcmp() in C, returns:
  #   -1 when less than
  #    0 when equal to
  #   +1 when greater than
  def <=>(other)
    balance <=> other.balance
  end
end

# This is the collection of individual objects
class Portfolio
  include Enumerable
  def initialize
    @accounts = []
  end

  # The collection must provide an internal iterator named 'each'
  # It accepts a block and converts it to a Proc?
  # Regardless, it does whatever each() typically does: accept &block
  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

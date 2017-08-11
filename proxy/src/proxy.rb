require 'etc'

# The Virtual Proxy delays creation of the object as long as possible.
# The object is created only when a method is called, not when the Virual Proxy is initialized.
class VirtualAccountProxy
  def initialize(&creation_block)
    @creation_block = creation_block
  end

  def method_missing(name, *args)
    s = subject   # Get/create the object
    s.send(name, *args)
  end

  def subject
    # Return the object if it exists OR
    # create a new object and return it.
    @subject || (@subject = @creation_block.call)
  end
end

# This is a demonstration of Protection Proxy: limiting access to the real object.
# If your current username does not match 'owner_name', you will be denied access.
class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def method_missing(name, *args)
    check_access
    @subject.send(name, *args)
  end

  def check_access
    if Etc.getlogin != @owner_name    # This gets the current user's login.
      raise "Illegal access: #{Etc.getlogin} cannot access account."
    end
  end
end

# This class stands in between the end user and the actual object.
# It forwards methods to the object but can process/filter
# actions and data before it does so.
class BankAccountProxy
  def initialize(real_object)
    @real_object = real_object
  end

  def method_missing(name, *args)
    @real_object.send(name, *args)
  end
end

class BankAccount
  attr_reader :balance

  def initialize(starting_balance=0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

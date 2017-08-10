require 'etc'

# This is a demonstration of Protection Proxy: limiting access to the real object.
# If your current username does not match 'owner_name', you will be denied access.
class AccountProtectionProxy
  def initialize(real_account, owner_name)
    @subject = real_account
    @owner_name = owner_name
  end

  def deposit(amount)
    check_access
    return @subject.deposit(amount)
  end

  def withdraw(amount)
    check_access
    return @subject.withdraw(amount)
  end

  def balance
    check_access
    return @subject.balance
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

  def balance
    @real_object.balance
  end

  def deposit(amount)
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    @real_object.withdraw(amount)
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

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Both are right, technically.
# Ben has used the preferred convention of calling the `getter` method made
#   available by `attr_reader :balance`.

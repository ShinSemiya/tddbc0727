# -*- encoding: utf-8 -*-

class VendingMachine
  attr_reader :amount

  def initialize
    @amount = 0
  end

  def accept(coin)
    if acceptable?(coin)
      @amount += coin
      0
    else
      coin
    end
  end

  def print
    @amount
  end

  def refund
    change = @amount
    @amount = 0
    change
  end

  def acceptable?(coin)
    [10, 50, 100, 500, 1000].include?(coin)
  end
end

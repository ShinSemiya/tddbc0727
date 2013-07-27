# -*- encoding: utf-8 -*-

class VendingMachine
  attr_reader :amount

  def initialize
    @amount = 0
  end

  def accept(coin)
    @amount += coin
    0
  end

  def print
    @amount
  end

  def refund
    change = @amount
    @amount = 0
    change
  end
end

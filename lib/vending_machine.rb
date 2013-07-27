# -*- encoding: utf-8 -*-

class VendingMachine
  attr_reader :amount

  def initialize
    @amount = 0
  end

  def accept(coin)
    @amount += coin
  end

  def print
    @amount
  end
end

# -*- encoding: utf-8 -*-

class VendingMachine
  attr_reader :amount

  def initialize
    @amount = 0
  end

  def insert(coin)
    @amount += coin
  end

  def print
    @amount
  end

  def refund

  end
end

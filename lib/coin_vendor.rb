# -*- encoding: utf-8 -*-

class CoinVendor
  attr_reader :amount

  def initialize
    @amount = 0
    @sales = 0
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

  def purchase(id)
    stock_vendor = StockVendor.new
    if has_amount?("コーラ") &&
       stock_vendor.has_item?("コーラ")
      item = stock_vendor.deliver("コーラ")
      @amount -= item[:price]
      @sales += item[:price]
      return item[:name]

    end
  end

  def has_amount?(id)
    stock_vendor = StockVendor.new
    stock_vendor.price(id) < @amount
  end


  def acceptable?(coin)
    [10, 50, 100, 500, 1000].include?(coin)
  end

end

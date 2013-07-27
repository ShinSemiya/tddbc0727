# -*- encoding: utf-8 -*-

class StockVendor

  def initialize
    @stocks = stocks
  end

  def stocks
     {"コーラ"=> {:price => 120,
            :name  => "コーラ",
            :count => 5,},}
  end
  def stock
    {"1" => 5}
  end

  def has_item?(id)
    @stocks[id][:count] > 0
  end

  def has_amount?(id)
    price(id) < @amount
  end

  def price(id)
    @stocks[id][:price]
  end
end


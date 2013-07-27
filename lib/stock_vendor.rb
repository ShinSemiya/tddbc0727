# -*- encoding: utf-8 -*-

class StockVendor
  attr_reader :stocks

  def initialize
    @stocks = stocks
  end

  def stocks
     {"コーラ"=> {:price => 120,
            :name  => "コーラ",
            :count => 5,},
      "水"=> {:price => 100,
               :name  => "水",
               :count => 5,},
      "レッドブル"=> {:price => "200",
               :name  => "レッドブル",
               :count => 5,},
     }
  end

  def has_item?(id)
    @stocks[id][:count] > 0
  end

  def price(id)
    @stocks[id][:price]
  end

  def deliver(id)
    @stocks[id][:count] -= 1
    @stocks[id]
  end
end


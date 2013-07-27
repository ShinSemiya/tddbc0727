# -*- encoding: utf-8 -*-
require 'spec_helper'

describe StockVendor do
  describe "#initialize" do
    it "show cola" do
      stock_vendor = StockVendor.new
      stocks        = stock_vendor.stocks
      cola = stocks["コーラ"]
      cola[:price].should == 120
      cola[:name].should  == "コーラ"
      cola[:count].should == 5
    end
  end
end


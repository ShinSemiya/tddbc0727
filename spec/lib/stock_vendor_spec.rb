# -*- encoding: utf-8 -*-
require 'spec_helper'

describe StockVendor do
  describe "#juice" do
    it "show juice" do
      stock_vendor = StockVendor.new
      juice        = stock_vendor.juice(1)

      juice[:price].should == 120
      juice[:name].should  == "コーラ"
    end
  end
end


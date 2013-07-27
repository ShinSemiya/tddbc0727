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

  describe '#has_item?' do
    context 'cola' do
      it 'return true' do
        stock_vendor = StockVendor.new
        stock_vendor.has_item?('コーラ').should be_true
      end
    end
  end

  describe '#deliver' do
    context 'cola' do
      it 'return cola' do
        stock_vendor = StockVendor.new
        cola = stock_vendor.deliver('コーラ')
        cola[:price].should == 120
        cola[:name].should  == "コーラ"
      end
    end
  end

end


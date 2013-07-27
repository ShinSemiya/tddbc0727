# -*- encoding: utf-8 -*-
require 'spec_helper'
describe CoinVendor do
  describe 'keeps amount' do
    context 'accept 100 after 50' do
      it 'works' do
        coin_vendor = CoinVendor.new
        coin_vendor.accept(100)
        coin_vendor.amount.should == 100
        coin_vendor.accept(50)
        coin_vendor.amount.should == 150
      end
    end
  end

  describe "#accept" do
    context "accept coin ¥100" do
      it "not rejected" do
        coin_vendor = CoinVendor.new
        coin_vendor.accept(100).should == 0
      end

      it "it works" do
        coin_vendor = CoinVendor.new
        coin_vendor.accept(100)
        coin_vendor.amount.should == 100
      end
    end
    context "accept coin ¥10000" do
      let! (:accept_coin){ 10000 }

      it "reject" do
        coin_vendor = CoinVendor.new
        coin_vendor.accept(accept_coin).should == accept_coin
      end
    end
  end

  describe "#print" do
    context "insert coin ¥100" do
      it "print amount " do
        coin_vendor = CoinVendor.new
        coin_vendor.accept(100)
        coin_vendor.print.should == 100
      end
    end
  end

  describe '#refund' do
    let! (:coin_vendor) do
      coin_vendor = CoinVendor.new
      coin_vendor.accept(100)
      coin_vendor
    end

    it 'call once, return 100' do
      coin_vendor.refund.should == 100
    end

    context 'after call once' do
      it 'clear amount' do
        coin_vendor.refund
        coin_vendor.refund.should == 0
      end
    end
  end

  describe '#acceptable?' do
    context 'ok coin' do
      it 'returns true' do
        coin_vendor = CoinVendor.new
        coin_vendor.acceptable?(100).should be_true
      end
    end

    context 'ng coin ' do
      it 'returns false' do
        coin_vendor = CoinVendor.new
        coin_vendor.acceptable?(10000).should be_false
      end
    end
  end

  describe '#has_amount' do
    it 'return true' do
      coin_vendor = CoinVendor.new
      coin_vendor.accept(500)

      coin_vendor.has_amount?('コーラ').should be_true
    end
  end

  describe '#purchase' do
    let! (:coin_vendor){
      coin_vendor = CoinVendor.new
      coin_vendor.accept(500)
      coin_vendor
    }

    it 'can purchase item' do
      coin_vendor.purchase('コーラ').should == 'コーラ'
    end

    it "return change" do
      coin_vendor.purchase('コーラ')
      coin_vendor.refund.should == 380
    end
  end

  describe "#find_stocks" do
    it "show stocks" do
      coin_vendor = CoinVendor.new
      coin_vendor.accept(150)
      showed_stocks = coin_vendor.find_stocks
      showed_stocks.should == ["コーラ", "水"]
    end
  end
end

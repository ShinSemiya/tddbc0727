# -*- encoding: utf-8 -*-
require 'spec_helper'
describe VendingMachine do
  describe 'keeps amount' do
    context 'accept 100 after 50' do
      it 'works' do
        vending_machine = VendingMachine.new
        vending_machine.accept(100)
        vending_machine.amount.should == 100
        vending_machine.accept(50)
        vending_machine.amount.should == 150
      end
    end
  end

  describe "#accept" do
    context "accept coin ¥100" do
      it "not rejected" do
        vending_machine = VendingMachine.new
        vending_machine.accept(100).should == 0
      end

      it "it works" do
        vending_machine = VendingMachine.new
        vending_machine.accept(100)
        vending_machine.amount.should == 100
      end
    end
    context "accept coin ¥10000" do
      let! (:accept_coin){ 10000 }

      it "reject" do
        vending_machine = VendingMachine.new
        vending_machine.accept(accept_coin).should == accept_coin
      end
    end
  end

  describe "#print" do
    context "insert coin ¥100" do
      it "print amount " do
        vending_machine = VendingMachine.new
        vending_machine.accept(100)
        vending_machine.print.should == 100
      end
    end
  end

  describe '#refund' do
    let! (:vending_machine) do
      vending_machine = VendingMachine.new
      vending_machine.accept(100)
      vending_machine
    end

    it 'call once, return 100' do
      vending_machine.refund.should == 100
    end

    context 'after call once' do
      it 'clear amount' do
        vending_machine.refund
        vending_machine.refund.should == 0
      end
    end
  end

  describe '#acceptable?' do
    context 'ok coin' do
      it 'returns true' do
        vending_machine = VendingMachine.new
        vending_machine.acceptable?(100).should be_true
      end
    end

    context 'ng coin ' do
      it 'returns false' do
        vending_machine = VendingMachine.new
        vending_machine.acceptable?(10000).should be_false
      end
    end
  end
end

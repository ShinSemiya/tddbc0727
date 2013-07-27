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
    context "insert coin ¥100" do
      it "it works" do
        vending_machine = VendingMachine.new
        vending_machine.accept(100)
        vending_machine.amount.should == 100
      end
    end
  end

  describe "#print" do
    context "insert coin ¥100" do
      it "should print STDOUT" do
        vending_machine = VendingMachine.new
        vending_machine.accept(100)
        vending_machine.print.should == 100
      end
    end
  end
end

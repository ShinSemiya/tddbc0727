# -*- encoding: utf-8 -*-
require 'spec_helper'
describe VendingMachine do
  describe "#accept" do
    context "insert coin ¥100" do
      it "it works" do
        vending_machine = VendingMachine.new
        vending_machine.accept(100)
        vending_machine.amount.should == 100
      end
    end
  end
end
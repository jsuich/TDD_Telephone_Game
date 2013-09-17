require 'rspec'

require "spec_helper"
require_relative "telephone"

describe Topping do 
  context 'testing class' do 
    it "should require a topping name" do 
      expect{Topping.new()}.to raise_error
      expect{Topping.new("poop")}.to_not raise_error
      expect{Topping.new("poop", 2)}.to_not raise_error
    end

    it "has necessary methods" do 
      should respond_to :cost
      should respond_to :name
      should respond_to :smells_ok?
    end
  end

  context 'instance of topping' do
    let!(:my_topping){Topping.new("slow child", 2)}

    it "has a boolean smell" do 
      expect{my_topping.smells_ok? == true || my_topping.smells_ok? == false}.should be_true
    end
  end




  # it { responds_to }
end

# describe PizzaOrderingSystem do

# end

# describe PizzaOrderingSystem do 
#   context 'testing class' do 
#|
#|
#|
#     it "should require a topping name" do 
#       expect{Topping.new()}.to raise_error
#       expect{Topping.new("poop")}.to_not raise_error
#       expect{Topping.new("poop", 2)}.to_not raise_error
#     end

#     it "has necessary methods" do 
#       should respond_to :cost
#       should respond_to :name
#       should respond_to :smells_ok?
#     end
#   end

#   context 'instance of topping'
#     let!(:my_topping){Topping.new("slow child", 2)}

#     it "has a boolean smell" do 
#       expect{my_topping.smells_ok? == true || my_topping.smells_ok? == false}.should be_true
#     end
#   end



#   # it { responds_to }
# end

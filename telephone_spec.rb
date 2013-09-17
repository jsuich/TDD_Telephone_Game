require 'rspec'

require "spec_helper"
require "telephone"

describe Topping do 
  it "should require a topping name" do 
    expect{Topping.new()}.to raise_error
  end

end

describe PizzaOrderingSystem do

end

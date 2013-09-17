# class Pizza
#   attr_accessor :toppings

#   def initialize(cook_time, toppings_array = [])
#     @toppings = toppings_array
#   end

#   def addTopping(topping)
#     toppings << topping
#   end
# end

class Topping
  attr_reader :cost, :name
  def initialize(topping_name, cost = 1)
    @name = name
    @cost = cost
  end
end


# class PizzaOrderingSystem

# do		



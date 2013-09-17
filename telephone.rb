

class Pizza
  attr_accessor :toppings
  @max_topping_size = {small: 2, medium: 3, large: 4}

  def initialize(size, cook_time)
    @toppings = toppings_array
  end

  def addTopping(topping)
    if @toppings.size  < max_topping_size
      toppings << topping
    end
  end
end






class Topping
  attr_reader :cost, :name

  def initialize(topping_name, cost = 1)
    @name = name
    @cost = cost
    @smells_ok = false
  end

  def smells_ok?
    return smells_ok
  end
end


# class PizzaOrderingSystem

# end 



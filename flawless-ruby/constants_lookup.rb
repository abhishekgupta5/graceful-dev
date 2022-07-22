FLOWER = "Clover"

module Neighborhood
  FLOWER = "Dogwood"
  
  module Yard
    FLOWER = "Rose"
    
    class Parent
      FLOWER = "Mountain Laurel"
    end
   
    class Child < Parent
      FLOWER = "Dandelion"

      def flower
        FLOWER
      end
    end
  end
end

Neighborhood::Yard::Child.new.flower    # Dandelion, else Rose, else Dogwood, else Mountain Laurel, else Clover

# The top level constant which isn't defined under any class or module is defined in the `Object` class

# How Ruby look up constants ->
Out then Up
1. Implementing class or module
2. Parent
3. Object 

# But Object class inherits from BasicObject
# If our class inherits from BasicObject, then top level constants defined will not be accessible
# just via their names (FLOWER).
# To force lookup in the Object class, Ruby provides a `::FLOWER` way. This work even inside BasicObject
# derived classes

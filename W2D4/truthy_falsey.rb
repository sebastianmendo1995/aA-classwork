class Restaurant
     attr_accessor :name, :chefs, :menu

     def initialize(name, chefs)
        @name = name
        @chefs = chefs
     end

     def menu 
        @menu ||= ['sammies','big ol cookies', 'bean blankies', 'chicky catch']
     end

end

five_star = Restaurant.new("Appetize Academy", ['Maria', 'Jose', 'Caly'])
p five_star
p five_star.menu
five_star.menu << 'pizza'
p five_star.menu
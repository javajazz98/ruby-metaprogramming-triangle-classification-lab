class Triangle
    attr_accessor :x, :y, :z

      def initialize(x,y,z)
        @x = x
        @y = y
        @z = z 
      end
    
      def kind
        am_i_actually_a_triangle 
           # :equilateral 
           #three equal sizes
        if x == y && y == z
          :equilateral
           # :isosceles
           # two equal sizes 
        elsif x == y || y == z || z == x 
          :isosceles
           #:scalene
           #no equal sides
          else 
            :scalene
          end
        end
      
        def am_i_actually_a_triangle
          triangles_are = [(x + y > z), (x + z > y), (y + z > x)]
          [x, y, z].each do |side|
            triangles_are << false if side <= 0 
            raise TriangleError if triangles_are.include?(false)
          end  
        end  
      
        class TriangleError < StandardError
        end
      end
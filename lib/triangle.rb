class Triangle
  attr_accessor :sideone, :sidetwo, :sidethree

  def initialize(sideone, sidetwo, sidethree)
    @sideone = sideone
    @sidetwo = sidetwo
    @sidethree = sidethree
  end

  #equilateral - having all its sides of the same length.
  #isosceles - (of a triangle) having two sides of equal length.
  #scalene triangle is a triangle that has three unequal sides,

  def kind
    validate
    #weird triangle
    if sidethree + sidetwo <= sideone || sideone + sidetwo <= sidethree || sidethree + sideone <= sidetwo
      raise TriangleError
    elsif sideone <= 0 || sideone <= 0 || sidethree <= 0
      begin
        raise TriangleError, "illegal"
      end
      # return :TriangleError - doesnt work
      #both true - all trues cos its all same
    elsif sideone == sidetwo && sidetwo == sidethree && sideone == sidethree
      return :equilateral
    elsif sidetwo == sidethree || sideone == sidetwo || sideone == sidethree
        #isosceles - either this or that?
      return :isosceles
      #wonky mate -
    else sideone != sidetwo && sidetwo != sidethree && sideone != sidethree
      return :scalene
    end
  end


  def validate
    proper_triangle = [(sideone + sidetwo > sidethree), (sideone + sidethree > sidetwo), (sidetwo + sidethree > sideone)]
    [sideone, sidetwo, sidethree].each { |side| proper_triangle << false if side <= 0 }
    raise TriangleError if proper_triangle.include?(false)
  end

  class TriangleError < StandardError
    def message
      "Does this look like a triangle though? illegal"
    end
  end

end

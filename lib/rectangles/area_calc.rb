require_relative 'rectangle'
module Rectangles

  # Defines simple calculator for computing a common area of two
  # squares which overlap.
  class AreaCalc
    # Message with result.
    RESULT_TEXT = "Obsah sjednoceni dvou ctvercu je %s."

    # Creates new AreaCalc and inits _square_list_.
    # ---
    # * Args::
    #   - _square_list_ list of two squares
    def initialize(square_list)
      @square_list = square_list
    end

    # Calculates the area of two overlapping squares from _square_list_.
    # ---
    # * Returns::
    #   - _area_ area of overlapping
    # * Raises::
    #   - _ArgumentError_ is there is not exactly two squares in _square_list_
    def calc_area
      raise ArgumentError if @square_list.size != 2

      area = 0.0
      area += @square_list[0].area
      area += @square_list[1].area

      overlapping_rectangle = @square_list[0].get_overlapping_rectangle(@square_list[1])
      area -= overlapping_rectangle.area 

      return area
    end
    
    # Invokes _calc_area_ method and puts calcutation result to I/O.
    def calculate
      begin
        puts RESULT_TEXT % calc_area
      rescue NoOverlapError => e
        puts e.message
      rescue ArgumentError => e
        puts e.message
      end
    end
  end
end
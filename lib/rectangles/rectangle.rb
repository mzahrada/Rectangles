module Rectangles

  # Data object which represents 2D shape rectangle.
  class Rectangle
    # Error message raised when rectangle cannot be created cos its coordinates are wrong.
    NOT_RECTANGLE_TEXT = 'Not rectangle.'
    # Error message raised when squares do not overlap.
    NO_OVERLAP_TEXT = 'Ctverce se ani nedotykaji.'

    # Rectangle is represented by positions of sides.
    attr_accessor :top, :bottom, :left, :right
    # Rectangles area.
    attr_accessor :area
    
    # Creates new Rectangle object using sides and calculates its area.
    # ---
    # * Args::
    #   - _top_ top side
    #   - _bottom_ bottom side
    #   - _left_ left side
    #   - _right_ right side
    # * Raises::
    #   - _NotRectangleError_ when given sides do not create rectangle
    def initialize(top,bottom,left,right)
      raise NotRectangleError.new(NOT_RECTANGLE_TEXT) if top < bottom || left > right
      @area = (top - bottom) * (right - left)
      @top = top
      @bottom = bottom
      @left = left
      @right = right
    end

    # Creates new overlapping Rectangle between _this_ and _other_ Rectangle.
    # * Args::
    #   - _other_ other Rectangle to be compared
    # * Raises::
    #   - _NoOverlapError_ if rectangles do not overlap
    def get_overlapping_rectangle(other)
      if(@top > other.bottom && @bottom < other.top && @right > other.left && @left < other.right)
        t = [@top,other.top].min
        b = [@bottom,other.bottom].max
        l = [@left,other.left].max
        r = [@right,other.right].min
        return Rectangle.new(t,b,l,r)
      end
      raise NoOverlapError.new(NO_OVERLAP_TEXT)
    end

    def to_s
      return "[top: " + @top.to_s + ", bottom: " + @bottom.to_s + ", left: " + @left.to_s + ", right: " + @right.to_s + ", area: " + @area.to_s + "]"
    end

    class << self
      # Creates new Rectangle object using midpoint _x_ and _y_ coordinate and _side_length_.
      # ---
      # * Args::
      #   - _mid_x_ x coordinate of midpoint
      #   - _mid_y_ y coordinate of midpoint
      #   - _side_length_ side length
      # * Returns::
      #   - new _Rectangle_ object
      def new_square_using_midpoint(mid_x, mid_y, side_length)
        half = side_length/2.0
        t = mid_y + half
        b = mid_y - half
        l = mid_x - half
        r = mid_x + half
        return Rectangle.new(t,b,l,r)
      end
    end
  end

  # Error class for signalizing rectangle errors.
  class NotRectangleError < StandardError
  end

  # Error class for signalizing rectangles do not overlap.
  class NoOverlapError < StandardError
  end
end
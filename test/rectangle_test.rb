$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'rectangles/rectangle'

class RectangleTest < Test::Unit::TestCase
  def test_new_error
    assert_raise(ArgumentError) { Rectangles::Rectangle.new(1,1,1) }
    assert_raise(Rectangles::NotRectangleError) { Rectangles::Rectangle.new(1,2,2,1) }
    assert_raise(Rectangles::NotRectangleError) { Rectangles::Rectangle.new(1,2,1,3) }
    assert_raise(Rectangles::NotRectangleError) { Rectangles::Rectangle.new(4,2,2,1) }
  end

  def test_new
    rect = Rectangles::Rectangle.new(4,2,1,3)
    assert_equal(4, rect.top)
    assert_equal(2, rect.bottom)
    assert_equal(1, rect.left)
    assert_equal(3, rect.right)
    assert_equal(4, rect.area)
  end

  def test_new_square_using_midpoint
    rect = Rectangles::Rectangle.new_square_using_midpoint(2,2,4)
    assert_equal(4, rect.top)
    assert_equal(0, rect.bottom)
    assert_equal(0, rect.left)
    assert_equal(4, rect.right)
    assert_equal(16, rect.area)
  end

  def test_overlapping_rectangle_area
    a = Rectangles::Rectangle.new(4,0,-2,2)
    b = Rectangles::Rectangle.new(3,1,1,3)
    c = a.get_overlapping_rectangle(b)
    assert_equal(2, c.area)
  end

  def test_not_overlapping_rectangles
    a = Rectangles::Rectangle.new(1,0,0,1)
    b = Rectangles::Rectangle.new(3,2,2,3)
    assert_raise(Rectangles::NoOverlapError) { a.get_overlapping_rectangle(b) }
  end

end
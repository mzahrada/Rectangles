$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'rectangles/area_calc'

class AreaCalcTest < Test::Unit::TestCase
  def test_example_1
    squares = [Rectangles::Rectangle.new_square_using_midpoint(0, 0, 4), Rectangles::Rectangle.new_square_using_midpoint(2, 2, 2)]
    calc = Rectangles::AreaCalc.new(squares)
    assert_equal(19, calc.calc_area)
  end

  def test_example_2
    squares = [Rectangles::Rectangle.new_square_using_midpoint(0.000, 0.000e-3, 4.0), Rectangles::Rectangle.new_square_using_midpoint(-2, -2e0, 2.0e+0)]
    calc = Rectangles::AreaCalc.new(squares)
    assert_equal(19, calc.calc_area)
  end

  def test_example_3
    squares = [Rectangles::Rectangle.new_square_using_midpoint(-10e20, 3e-2, 5.23), Rectangles::Rectangle.new_square_using_midpoint(+3e100, -1, 4.345643225)]
    calc = Rectangles::AreaCalc.new(squares)
    assert_raise(Rectangles::NoOverlapError) { calc.calc_area }
  end

  def test_no_overlap
    squares = [Rectangles::Rectangle.new_square_using_midpoint(0, 0, 1), Rectangles::Rectangle.new_square_using_midpoint(3, 3, 1)]
    calc = Rectangles::AreaCalc.new(squares)
    assert_raise(Rectangles::NoOverlapError) { calc.calc_area }
  end

  def test_arg_error
    squares = [Rectangles::Rectangle.new_square_using_midpoint(0, 0, 4)]
    calc = Rectangles::AreaCalc.new(squares)
    assert_raise(ArgumentError) { calc.calc_area }
  end
end

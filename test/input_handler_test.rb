$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'rectangles/input_handler'

class InputHandlerTest < Test::Unit::TestCase
  def test_are_floats
    ih = Rectangles::InputHandler.new;
    Rectangles::InputHandler.send(:public, :are_floats?)

    assert_equal(true, ih.are_floats?(2.1, 0.000e-3))
    assert_equal(false, ih.are_floats?('a', 2.1))
    assert_equal(false, ih.are_floats?(2, 2.1))
    assert_equal(true, ih.are_floats?(Float(2), 2.1))
    assert_equal(true, ih.are_floats?(+3e100, -10e20))
  end
end

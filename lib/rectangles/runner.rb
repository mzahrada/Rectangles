require_relative 'input_handler'
require_relative 'area_calc'

# Module that counts area of two covering squares.
#
# Author:: Martin Zahradnicky  (mailto:zahrama8@fit.cvut.cz)
module Rectangles

  # Runner class for Rectangles module.
  class Runner

    # Main method for running Rectangles module.
    def run
      handler = InputHandler.new
      calc = AreaCalc.new(handler.get_squares)
      calc.calculate
    end
  end
end

#runner = Rectangles::Runner.new(ARGV)
#runner.run()

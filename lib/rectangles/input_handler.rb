require_relative 'rectangle'
module Rectangles
  
  # Implements handler for users input.
  # Creates array of two squares from users input.
  class InputHandler
    # Names of squares.
    @@square_names = ["prvniho", "druheho"]
    # Error message raised when wrong input provided.
    INPUT_ERROR = "Spatny vstup."
    # Prompt message shown for obtaining _side_lenght_ of square.
    SIDE_LENGTH_TEXT = "Zadejte delku hrany %s ctverce: "
    # Prompt message shown for obtaining _x_ coordinate of square.
    X_COORD_TEXT = "Zadejte x-ovou souradnici stredu %s ctverce: "
    # Prompt message shown for obtaining _y_ coordinate of square.
    Y_COORD_TEXT = "Zadejte y-ovou souradnici stredu %s ctverce: "

    # Prompts user to input information about two squares a returns them.
    # ---
    # * Returns::
    #   - _square_list_ list of two Square objects in array
    def get_squares
      square_list = []
      @@square_names.each { |name|
        begin
          side_length = Float(get_input(SIDE_LENGTH_TEXT % name))
          raise ArgumentError if side_length < 0

          midpoint_x = Float(get_input(X_COORD_TEXT % name))
          midpoint_y = Float(get_input(Y_COORD_TEXT % name))
          raise ArgumentError if not are_floats?(midpoint_x, midpoint_y)
          
          square_list << Rectangle.new_square_using_midpoint(midpoint_x, midpoint_y, side_length)
          
        rescue ArgumentError => e
          abort(INPUT_ERROR)
        end
      }
      return square_list
    end

    private
      # Tests if _x_ and _y_ are Float.
      # ---
      # * Returns::
      #   - +T+ if both _x_ and _y_ are Float
      def are_floats?(x,y)
        return x.is_a?(Float) && y.is_a?(Float)
      end

      # Prints message in _msg_ and returns users input.
      # ---
      # * Returns::
      #   - users input
      def get_input(*msg)
        print *msg
        return gets.strip
      end
  end
end

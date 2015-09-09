require 'pry'

class Grid

  attr_reader   :size
  attr_accessor :layout, :label_array

  def initialize(size = 10)
    @label_array = []
    @size = size
    build_grid(size)
  end

  def build_grid(size)
    @layout = Array.new(size * size)
  end

  #def fill_grid_with_cells(size)
    #letter = 'A'
    #size.times do |grid_element |
      #@layout << Cell.new("#{letter}#{grid_element}")
        #element = Cell.new("#{letter}#{number}")
      #end
    #end
    #letter.next!
  #end

  def y_axis_labels
    single_letter = "A"
    letter_array = []
    (1..size).each { |column| letter_array << single_letter; single_letter.next! }
    letter_array
  end
  def cell_labels(size)
    letter = 'A'
    for number in 1..size do
      label_array << "#{letter}#{number}"
      letter.next!
    end
  end
end

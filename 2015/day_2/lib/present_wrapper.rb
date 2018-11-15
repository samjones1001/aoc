class PresentWrapper
  def wrap_all_presents(present_list)
    process_presents(present_list, method(:get_wrapping))
  end

  def ribbon_all_presents(present_list)
    process_presents(present_list, method(:get_ribbon))
  end

  private
  def process_presents(present_list, action)
    present_list.split("\n").map{ |present| action.call(present) }.sum
  end

  def get_wrapping(dimension_string)
    dimensions = get_dimensions(dimension_string)
    sides = get_sides(dimensions)
    (sides.sum * 2) + get_smallest_side(sides)
  end

  def get_dimensions(dimension_string)
    dimension_string.split('x').map{ |dimension| dimension.to_i }
  end

  def get_sides(dimension_array)
    dimension_array.combination(2).map{ |a,b| a*b }
  end

  def get_smallest_side(sides_array)
    sides_array.min
  end

  def get_ribbon(dimension_string)
    dimensions = get_dimensions(dimension_string)
    get_volume(dimensions) + smallest_circumference(dimensions)
  end

  def get_volume(dimensions)
    dimensions.inject(:*)
  end

  def smallest_circumference(dimensions)
    dimensions.delete(dimensions.max)
    dimensions.sum * 2
  end
end

class FrequencyCalibrator
  def calculate_frequency(input)
    input_to_nums(input).sum
  end

  private
  def input_to_nums(input)
    input.split("\n").map{ |str| str.to_i }
  end
end

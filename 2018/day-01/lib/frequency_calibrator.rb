class FrequencyCalibrator
  attr_reader :history

  def initialize
    @history = [0]
  end

  def process_instructions(input)
    while true
      input_to_nums(input).each do |num|
        value = calculate_next_frequency(num)
        return value if history.include?(value)
        history << value
      end
    end
  end

  def sum_of_frequencies(input)
    input_to_nums(input).sum
  end

  private
  def input_to_nums(input)
    input.split("\n").map{ |str| str.to_i }
  end

  def calculate_next_frequency(frequency)
    frequency + history[-1]
  end
end

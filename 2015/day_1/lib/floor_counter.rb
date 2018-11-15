class FloorCounter
  def initialize
    @floor = 0
  end

  def get_floor
    @floor
  end

  def get_final_floor(input)
    process_instructions(input)[-1]
  end

  def detect_basement_entry(input)
    process_instructions(input).index do
      |floor| floor < 0
    end + 1
  end

  private
  def process_instructions(input)
    input.split('').map do
      |instruction| process_instruction(instruction)
    end
  end

  def process_instruction(instruction)
    @floor = instruction == '(' ? @floor + 1 : @floor - 1
  end
end

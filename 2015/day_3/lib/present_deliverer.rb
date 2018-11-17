class PresentDeliverer
  attr_reader :visited, :location

  def initialize
    @visited = [{x: 0, y: 0}]
    @location = {x: 0, y: 0}
  end

  def move(direction)
    location[:y] += 1 if direction == '^'
    location[:y] -= 1 if direction == 'v'
    location[:x] += 1 if direction == '>'
    location[:x] -= 1 if direction == '<'
    @visited.push(location.clone)
  end
end

class LightGrid
  attr_reader :lights, :light_klass

  def initialize(light_klass = Light)
    @lights = []
    @light_klass = light_klass
    populate
  end

  def instruct_light(instruction, light)
    return light.switch_on if instruction == 'on'
    return light.switch_off if instruction == 'off'
    light.toggle
  end

  def on_count
    lights.select{ |light| light.on? }.count
  end

  private
  def populate
    (0..999).each do |x_coord|
      (0..999).each do |y_coord|
        lights.push(light_klass.new(x_coord, y_coord))
      end
    end
  end
end

class Light
  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
    @on = false
  end

  def on?
    @on
  end

  def toggle
    @on = !@on
  end

  def switch_on
    @on = true
  end

  def switch_off
    @on = false
  end
end

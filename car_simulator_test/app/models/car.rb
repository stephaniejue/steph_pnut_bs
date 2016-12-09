class Car

  def initialize(make, year, color)
    @make = make
    @year = year
    @color = color
    @speed = 0
    @lights = false
    @parking_brake = "Off"
  end

  def accelerate
    if @parking_brake == "Off"
      @speed += 10
    else
      @speed = @speed
    end
  end

  def brake
    @speed -= 7
  end

  def speed=(speed)
    @speed = speed
  end

  def make
    @make
  end

  def year
    @year
  end

  def speed
    @speed
  end

  def lights=(boolean)
    @lights = boolean
  end

  def lights_on?
    @lights
  end

  def parking_brake=(brake)
    if @speed > 0
      @parking_brake = "Off"
    else
      @parking_brake = brake
    end
  end

  def parking_brake
    @parking_brake
  end

  def color
    @color
  end

end

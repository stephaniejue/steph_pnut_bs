class Car

  def initialize(make, year)
    @make = make
    @year = year
    @speed = 0
    @lights = false
    @parking_brake = "Off"
  end

  def accelerate
    @speed += 10
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
    @parking_brake = brake
  end

  def parking_brake
    @parking_brake
  end

end

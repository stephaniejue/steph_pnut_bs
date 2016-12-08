class Car
  def initialize(make, year)
    @make = make
    @year = year
    @speed = 0
    @lights = false
    @parking_brake = "Off"
  end

  def info
    "#{@year} #{@make} -- Speed is: #{@speed} km/h -- Lights are on: #{@lights} -- Parking Brake is #{@parking_brake}"
  end

  def speed
    @speed
  end

  def speed=(speed)
    @speed = speed
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed -= 7
  end

  def make
    @make
  end

  def year
    @year
  end

  def lights=(boolean)
    @lights = boolean
  end


  def lights
    @lights
  end

  def parking_brake=(brake)
    @parking_brake = brake
  end

  def parking_brake_on
    @parking_brake
  end

end

class CarsController < ApplicationController

  def index
    if params.has_key?(:make) && params.has_key?(:make) && params.has_key?(:color) && !params[:make].strip.empty? && !params[:year].strip.empty? && !params[:color].strip.empty?
    # if we have the params
      make = params[:make]
      year = params[:year]
      color = params[:color]
      @car = Car.new(make, year, color)
      session[:car] = @car.to_yaml
      redirect_to "/cars/status"
      # make car
      # redirect_to status
      # show index
    else
      flash.now[:alert] = "Make a car!"
      # maybe with flash errors
    end
  end

  def status
    @car = YAML.load(session[:car])
  end

  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    redirect_to "/cars/status"
  end

  def brake
    @car = YAML.load(session[:car])
    if @car.speed >= 7
      @car.brake
    else
      @car.speed=(0)
    end
    session[:car] = @car.to_yaml
    redirect_to "/cars/status"
  end

  def lights
    @car = YAML.load(session[:car])
    @car.lights = @car.lights_on? ? false : true
    session[:car] = @car.to_yaml
    redirect_to "/cars/status"
  end

  def parking_brake
    @car = YAML.load(session[:car])
    @car.parking_brake=(params[:parking_brake])
    session[:car] = @car.to_yaml
    redirect_to "/cars/status"
  end

end

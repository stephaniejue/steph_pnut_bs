class CarsController < ApplicationController
  def index
    if params.has_key?(:make) && params.has_key?(:make) && !params[:make].strip.empty? && !params[:year].strip.empty?
      car = Car.new(params[:make], params[:year])
      session[:car] = car.to_yaml
      redirect_to "/cars/status"
    else
      flash.now[:alert] = "Make a car!"
    end
  end

  def status
    Rails.logger.info session[:car]
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

    if @car.speed > 7
      @car.brake
      session[:car] = @car.to_yaml
      redirect_to "/cars/status"
    else
      @car.speed=(0)
      session[:car] = @car.to_yaml
      redirect_to "/cars/status"
    end
  end

  def lights
    @car = YAML.load(session[:car])

    if @car.lights == false
      @car.lights=(true)
      session[:car] = @car.to_yaml
      redirect_to "/cars/status"
    else
      @car.lights=(false)
      session[:car] = @car.to_yaml
      redirect_to "/cars/status"
    end
  end

  def parking_brake
    @car = YAML.load(session[:car])
    @car.parking_brake=(params[:parking_brake])
    # if @car.parking_brake == "Off"

    session[:car] = @car.to_yaml
    redirect_to "/cars/status"

  end
end

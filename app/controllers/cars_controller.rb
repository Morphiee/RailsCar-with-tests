class CarsController < ApplicationController
  def index
  end
  def create
    make = params[:make]
    model_year = params[:model_year]
    @car = Car.new(make, model_year)
    session[:car] = @car.to_yaml
  end
  def accelerate
    @car = YAML.load(session[:car])
    @car.accelerate
    session[:car] = @car.to_yaml
    render "create.html.erb"
  end
  def brake
    @car = YAML.load(session[:car])
    @car.brake
    session[:car] = @car.to_yaml
    render "create.html.erb"
  end
  def lights
    @car = YAML.load(session[:car])
    @car.toggle_lights
    session[:car] = @car.to_yaml
    render "create.html.erb"
  end
  def parking_brake
    @car = YAML.load(session[:car])
    if params[:parking_brake] == "on"
        @car.parking_brake_on
        session[:car] = @car.to_yaml
        render "create.html.erb"
    end
    if params[:parking_brake] == "off"
        @car.parking_brake_off
        session[:car] = @car.to_yaml
        render "create.html.erb"
    end
  end
end

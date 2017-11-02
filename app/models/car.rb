class Car
  def initialize(make, model_year, lights=false, parking_brake="on")
    @make = make
    @model_year = model_year
    @speed = 0
    @lights = lights
    @parking_brake = parking_brake
  end
  def make
    @make
  end
  def model_year
    @model_year
  end
  def speed
    @speed
  end
  def accelerate
    if @parking_brake != 'on'
      @speed = @speed + 10
    end
  end
  def brake
    if @speed >= 7
      @speed = @speed - 7
    else
      @speed = 0
    end
  end
  def lights
    @lights
  end
  def toggle_lights
    @lights = !(@lights)
  end
  def parking_brake
    @parking_brake
  end
  def parking_brake_on
    if @speed == 0
      @parking_brake = "on"
    elsif @speed > 0
      @parking_brake = "off"
    end
  end
  def parking_brake_off
    @parking_brake = "off"
  end
end

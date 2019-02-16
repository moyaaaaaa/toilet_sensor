class SensorsController < ApplicationController
  before_action :set_sensor, only: :update
  protect_from_forgery except: :update

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    if @sensor.update(sensor_params)
      render json: { status: :ok }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find_by!(serial_id: params[:serial_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:voltage, :opened)
    end
end

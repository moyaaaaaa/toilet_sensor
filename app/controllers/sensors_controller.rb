class SensorsController < ApplicationController
  before_action :set_sensor, only: :update

  # GET /sensors
  # GET /sensors.json
  def index
    @sensors = Sensor.all
  end

  # PATCH/PUT /sensors/1
  # PATCH/PUT /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = Sensor.find_by(serial_id: params[:serial_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sensor_params
      params.require(:sensor).permit(:voltage, :opened)
    end
end

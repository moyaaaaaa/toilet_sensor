class ChangeSerialIdLengthSensors < ActiveRecord::Migration[5.2]
  def change
    change_column :sensors, :serial_id, :string, limit: 50
  end
end

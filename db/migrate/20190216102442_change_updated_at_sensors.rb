class ChangeUpdatedAtSensors < ActiveRecord::Migration[5.2]
  def change
    change_column :sensors, :updated_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

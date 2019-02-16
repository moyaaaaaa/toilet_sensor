class ChangeColumnSensors < ActiveRecord::Migration[5.2]
  def change
    change_column :sensors, :created_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

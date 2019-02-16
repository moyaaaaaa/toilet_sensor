class AddUniqueSensors < ActiveRecord::Migration[5.2]
  def change
    add_index  :sensors, [:serial_id], unique: true
  end
end

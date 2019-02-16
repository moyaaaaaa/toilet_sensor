class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.string :serial_id, null: false, limit: 50
      t.float :voltage
      t.boolean :opened, null:false, default: true

      t.timestamps
    end
  end
end

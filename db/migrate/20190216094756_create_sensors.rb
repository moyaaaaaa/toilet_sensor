class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.string :RAILS_ENV=development

      t.timestamps
    end
  end
end

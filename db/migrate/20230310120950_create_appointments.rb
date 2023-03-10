class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :type
      t.string :title
      t.integer :duration
      t.string :datetime

      t.timestamps
    end
  end
end

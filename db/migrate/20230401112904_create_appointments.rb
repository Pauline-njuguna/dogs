class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :pet, null: false, foreign_key: true
      t.datetime :date_time
      t.string :type_of_appointment

      t.timestamps
    end
  end
end
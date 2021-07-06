class CreateLandscapingServices < ActiveRecord::Migration[5.2]
  def change
    create_table :landscaping_services do |t|
      t.references :senior, foreign_key: true
      t.references :student, foreign_key: true
      t.string :landscape_service
      t.decimal :fee_per_hour, precision: 6, scale: 2
      t.datetime :date_time

      t.timestamps
    end
  end
end

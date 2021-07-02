class CreateLandscapingServices < ActiveRecord::Migration[5.2]
  def change
    create_table :landscaping_services do |t|
      t.references :senior, foreign_key: true
      t.references :student, foreign_key: true
      t.string :landscape_service
      t.float :fee_per_hour
      t.datetime :date_time

      t.timestamps
    end
  end
end

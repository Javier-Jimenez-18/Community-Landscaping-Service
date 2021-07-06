class CreateMyDates < ActiveRecord::Migration[5.2]
  def change
    create_table :my_dates do |t|
      t.datetime :dt
      t.timestamps
    end
  end
end

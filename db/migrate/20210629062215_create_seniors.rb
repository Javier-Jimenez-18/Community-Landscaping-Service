class CreateSeniors < ActiveRecord::Migration[5.2]
  def change
    create_table :seniors do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

class CreateVolunteers < ActiveRecord::Migration[6.1]
  def change
    create_table :volunteers do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :city, null: false
      t.timestamps
    end
  end
end

class AddCityToVolunteers < ActiveRecord::Migration[6.1]
  def change
    add_reference :volunteers, :city, null: false, foreign_key: true
  end
end

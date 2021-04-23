class RemoveCityFromVolunteers < ActiveRecord::Migration[6.1]
  def change
    remove_column :volunteers, :city, :string
  end
end

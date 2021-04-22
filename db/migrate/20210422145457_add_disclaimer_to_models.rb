class AddDisclaimerToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :hospital_beds, :disclaimer, :boolean, default: false
    add_column :oxygen_suppliers, :disclaimer, :boolean, default: false
    add_column :plasma_donors, :disclaimer, :boolean, default: false
  end
end

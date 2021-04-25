class AddDisclaimerToMedicines < ActiveRecord::Migration[6.1]
  def change
    add_column :medicines, :disclaimer, :boolean, default: false
  end
end

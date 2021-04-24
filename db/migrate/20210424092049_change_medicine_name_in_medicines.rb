class ChangeMedicineNameInMedicines < ActiveRecord::Migration[6.1]
  def change
    remove_column :medicines, :medicine_name
    add_column :medicines, :medicine_name, :integer, null: false
  end
end

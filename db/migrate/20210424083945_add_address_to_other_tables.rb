class AddAddressToOtherTables < ActiveRecord::Migration[6.1]
  def change
    add_column :medicines, :address, :string
    add_column :oxygen_suppliers, :address, :string
    add_column :plasma_donors, :address, :string

  end
end

class ChangeColumnLastUpdatedAt < ActiveRecord::Migration[6.1]
  def change
    remove_column :medicines, :last_updated_at
    add_column :medicines, :last_verified_at, :datetime
  end
end

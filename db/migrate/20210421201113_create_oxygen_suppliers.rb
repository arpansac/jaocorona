class CreateOxygenSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :oxygen_suppliers do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :alternate_phone
      t.references :city, null: false, foreign_key: true
      t.boolean :unavailable, null: false, default: false
      t.boolean :fake, null: false, default: false
      t.boolean :old, null: false, default: false
      t.datetime :last_verified_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

class CreatePlasmaDonors < ActiveRecord::Migration[6.1]
  def change
    create_table :plasma_donors do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :alternate_phone
      t.integer :blood_group, null: false
      t.references :city, null: false, foreign_key: true
      t.integer :pincode
      t.datetime :last_verified_at
      t.boolean :unavailable, null: false, default: false
      t.boolean :fake, null: false, default: false
      t.boolean :old, null: false, default: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

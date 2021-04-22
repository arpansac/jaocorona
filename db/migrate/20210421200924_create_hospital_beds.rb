class CreateHospitalBeds < ActiveRecord::Migration[6.1]
  def change
    create_table :hospital_beds do |t|
      t.string :hospital_name, null: false
      t.string :contact_name
      t.string :phone, null: false
      t.string :alternate_phone
      t.string :address, null: false
      t.references :city, null: false, foreign_key: true
      t.integer :icu_beds, null: false
      t.integer :beds, null: false
      t.boolean :unavailable, null: false, default: false
      t.boolean :fake, null: false, default: false
      t.boolean :old, null: false, default: false
      t.datetime :last_verified_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

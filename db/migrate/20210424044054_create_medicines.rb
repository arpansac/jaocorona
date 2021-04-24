class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.string :medicine_name, null: false
      t.string :contact_name
      t.string :phone, null: false
      t.string :alternate_phone
      t.references :city, null: false, foreign_key: true
      t.boolean :fake, default: false
      t.boolean :unavailable, default: false
      t.datetime :last_updated_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

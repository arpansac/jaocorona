class CreateExternalLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :external_links do |t|
      t.references :city, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.string :description
      t.string :favicon
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

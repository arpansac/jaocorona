class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, required: true
      t.string :state, index: true

      t.timestamps
    end
  end
end

class CreateFrontEndAppTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :front_end_app_tokens do |t|
      t.string :token
      t.boolean :is_valid

      t.timestamps
    end
  end
end

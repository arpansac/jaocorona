class AddCovidCureDateToPlasmaDonors < ActiveRecord::Migration[6.1]
  def change
    add_column :plasma_donors, :covid_cured_at, :date
  end
end

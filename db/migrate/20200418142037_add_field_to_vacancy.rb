class AddFieldToVacancy < ActiveRecord::Migration[5.1]
  def change
    add_column :vacancies, :employment, :string
  end
end

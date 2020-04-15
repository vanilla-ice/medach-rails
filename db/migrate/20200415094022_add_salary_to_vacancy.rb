class AddSalaryToVacancy < ActiveRecord::Migration[5.1]
  def change
    add_column :vacancies, :salary, :integer
  end
end

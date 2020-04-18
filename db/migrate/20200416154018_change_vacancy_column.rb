class ChangeVacancyColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :vacancies, :salary, :string
  end
end

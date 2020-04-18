class CreateVacancyResponds < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancy_responses do |t|
      t.string :full_name
      t.string :phone
      t.string :email
      t.text :covering_letter
      t.references :vacancy

      t.timestamps
    end
  end
end

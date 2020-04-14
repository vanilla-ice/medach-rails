class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.boolean :is_approved
      t.string :title
      t.string :employer
      t.string :location
      t.string :experience
      t.string :contacts
      t.boolean :is_promoted
      t.string :external_url
      t.text :content
      
      t.timestamps
    end
  end
end

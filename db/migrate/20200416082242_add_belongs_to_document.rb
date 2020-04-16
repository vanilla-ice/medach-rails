class AddBelongsToDocument < ActiveRecord::Migration[5.1]
  def change
    add_reference :vacancy_responses, :document
  end
end

class AddCreatedByToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :creator, foreign_key: { to_table: :users }
  end
end

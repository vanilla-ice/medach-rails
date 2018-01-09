class AddFixedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :fixed, :boolean, null: false, default: false

  end
end

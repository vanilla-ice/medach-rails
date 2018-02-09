class AddSearchToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :search, :string
    add_index :articles, :search
  end
end

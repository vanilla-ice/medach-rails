class AddShortFieldToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :shorttext, :string
    add_index :articles, :shorttext
  end
end

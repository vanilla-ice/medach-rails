class AddOriginAndTranslateToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :origin, :string
    add_column :articles, :translate, :string
    add_index :articles, :origin
    add_index :articles, :translate
  end
end

class AddShortFieldToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :shorttext, :string
  end
end

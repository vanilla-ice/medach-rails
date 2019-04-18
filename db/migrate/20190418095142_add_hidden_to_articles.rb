class AddHiddenToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :hidden, :boolean, default: false
  end
end

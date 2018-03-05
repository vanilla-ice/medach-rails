class AddTypeToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :type, :string
  end
end

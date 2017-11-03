class AddFieldsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :author, :string
    add_column :articles, :infographic, :string
    add_column :articles, :redaction, :string
  end
end

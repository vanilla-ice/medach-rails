class AddPublishOnToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :publish_on, :datetime
    add_index :articles, :publish_on
  end
end

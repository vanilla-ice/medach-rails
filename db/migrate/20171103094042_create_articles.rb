class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :body
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end

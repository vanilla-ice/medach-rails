class CreatePageMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :page_meta do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :title
      t.string :type
      t.string :keywords

      t.timestamps
    end
  end
end

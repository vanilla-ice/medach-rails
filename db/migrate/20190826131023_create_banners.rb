class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.integer :article_id
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end

class CreateAdBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_banners do |t|
      t.integer :ad_type, null: false
      t.integer :ad_position, null: false
      t.integer :article_type, null: false
      t.string :google_id
      t.string :link
      t.string :image

      t.timestamps
    end
  end
end

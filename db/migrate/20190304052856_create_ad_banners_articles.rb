class CreateAdBannersArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :ad_banners_articles do |t|
      t.references :ad_banner, null: false, index: true, foreign_key: true
      t.references :article, null: false, index: true, foreign_key: true
      t.boolean :automaticly_created, null: false, default: false
    end
  end
end

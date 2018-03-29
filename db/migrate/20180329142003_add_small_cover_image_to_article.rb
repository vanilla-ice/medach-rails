class AddSmallCoverImageToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :small_cover_image, :string
  end
end

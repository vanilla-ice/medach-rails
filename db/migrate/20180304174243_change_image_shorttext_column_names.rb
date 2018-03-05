class ChangeImageShorttextColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :image, :cover_image
    rename_column :articles, :shorttext, :short_description
  end
end

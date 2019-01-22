class AddSliderImageToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :slider_image, :string
  end
end

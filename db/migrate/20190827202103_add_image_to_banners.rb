class AddImageToBanners < ActiveRecord::Migration[5.1]
  def change
    add_column :banners, :image, :string
  end
end

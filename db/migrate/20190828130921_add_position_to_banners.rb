class AddPositionToBanners < ActiveRecord::Migration[5.1]
  def change
  	add_column :banners, :position, :string
  end
end

class AddCoverImageToUserProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :user_profiles, :cover_image, :text
  end
end

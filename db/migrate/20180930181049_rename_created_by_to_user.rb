class RenameCreatedByToUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :creator_id, :user_id
  end
end

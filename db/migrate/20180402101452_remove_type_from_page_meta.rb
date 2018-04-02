class RemoveTypeFromPageMeta < ActiveRecord::Migration[5.1]
  def change
    remove_column :page_meta, :type
  end
end

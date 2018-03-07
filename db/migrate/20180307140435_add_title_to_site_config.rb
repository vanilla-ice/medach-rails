class AddTitleToSiteConfig < ActiveRecord::Migration[5.1]
  def change
    add_column :site_configs, :title, :string
  end
end

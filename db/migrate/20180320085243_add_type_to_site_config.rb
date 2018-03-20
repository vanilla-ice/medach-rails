class AddTypeToSiteConfig < ActiveRecord::Migration[5.1]
  class SiteConfig < ActiveRecord::Base
  end

  def change
    add_column :site_configs, :type, :string, :default => 'MainConfig'
    SiteConfig.update_all(type: 'MainConfig')
  end
end

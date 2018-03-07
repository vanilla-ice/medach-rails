class CreateSiteConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :site_configs do |t|
      t.json :data
      t.boolean :active

      t.timestamps
    end
  end
end

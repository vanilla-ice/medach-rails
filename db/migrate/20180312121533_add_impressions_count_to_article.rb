class AddImpressionsCountToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :impressions_count, :integer, null: false, default: 0
  end
end

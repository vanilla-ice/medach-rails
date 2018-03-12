class AddPartnerToArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :partner, foreign_key: true
  end
end

class CreateArticleTypo < ActiveRecord::Migration[5.1]
  def change
    create_table :article_typos do |t|
      t.string :typo_text
      t.text :commentary
      t.boolean :fixed, default: false
      t.belongs_to :article
    end
  end
end

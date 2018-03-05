class ChangeArticleTypeColumnNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :articles, :type, false, "LongreadArticle"
  end
end

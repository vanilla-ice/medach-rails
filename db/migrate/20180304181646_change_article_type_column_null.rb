class ChangeArticleTypeColumnNull < ActiveRecord::Migration[5.1]
  class Article < ActiveRecord::Base
  end

  def change
    change_column_null :articles, :type, false, "LongreadArticle"
    Article.reset_column_information
    Article.update_all(type: 'LongreadArticle')
  end
end

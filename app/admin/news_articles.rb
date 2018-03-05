ActiveAdmin.register NewsArticle do
  permit_params :body, :cover_image, :title, :author, :infographic, :redaction, :created_at, :tag_list, :publish_on, :short_description, :origin, :translate, :fixed

  menu parent: "Articles"

  filter :tags
  filter :body
  filter :title
  filter :created_at
  filter :author
  filter :infographic
  filter :redaction
  filter :origin
  filter :fixed

  show do
    render 'admin/article', {article: news_article}
  end

  index do
    column :cover_image do |i|
      image_tag i.cover_image, class: "admin__cover-image"
    end
    column :title
    column :short_description
    column :tag_list
    column :author
    column :created_at
    column :publish_on
    actions
  end

  form partial: 'news_article_form'

end
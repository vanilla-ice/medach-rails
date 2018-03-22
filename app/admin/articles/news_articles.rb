ActiveAdmin.register NewsArticle do
  permit_params(
    :body,
    :cover_image,
    :title,
    :author,
    :infographic,
    :redaction,
    :created_at,
    :tag_list,
    :tag_string,
    :publish_on,
    :short_description,
    :origin,
    :translate,
    :fixed
  )

  menu parent: "Статьи"

  filter :tags, label: 'Теги'
  filter :body, label: 'Текст статьи'
  filter :title, label: 'Заголовок'
  filter :created_at, label: 'Дата создания'
  filter :author, label: 'Автор'
  filter :infographic, label: 'Инфографика'
  filter :redaction, label: 'Редакция'
  filter :origin, label: 'Оригинал'


  show do
    render 'admin/article', {article: news_article}
  end

  index do
    column 'Обложка', :cover_image do |i|
      image_tag i.cover_image, class: "admin__cover-image"
    end
    column 'Заголовок', :title
    column 'Краткое описание', :short_description
    column 'Теги', :tag_list
    column 'Автор', :author
    column 'Дата создания', :created_at
    column 'Дата публикации', :publish_on
    actions
  end

  form partial: 'news_article_form'

end
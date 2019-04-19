ActiveAdmin.register BlogArticle do
  permit_params(
    :body,
    :cover_image,
    :remove_cover_image,
    :small_cover_image,
    :remove_small_cover_image,
    :avatar_cache,
    :short_description,
    :avatar,
    :remove_avatar,
    :title,
    :author,
    :infographic,
    :redaction,
    :created_at,
    :tag_list,
    :tag_string,
    :publish_on,
    :shorttext,
    :origin,
    :translate,
    :fixed,
    :partner_id,
    :user_id,
    :type,
    :hidden
  )

  before_create do |article|
    article.user = current_user
  end

  before_save do |article|
    article.updater = current_user
  end

  controller do
    def update
      update! do |format|
        path = "admin_#{Article.find(resource.id).model_name.element}_path"
        format.html { redirect_to self.send(path, resource.id)}
      end
    end
  end

  menu parent: "Статьи"

  filter :tags, label: 'Теги'
  filter :body, label: 'Текст статьи'
  filter :title, label: 'Заголовок'
  filter :created_at, label: 'Дата создания'
  filter :author, label: 'Автор'
  filter :infographic, label: 'Инфографика'
  filter :redaction, label: 'Редакция'
  filter :origin, label: 'Оригинал'

  show title: :title do
    render 'admin/article', { article: blog_article }
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
    column 'Дата изменения', :updated_at
    column 'Обновил', :updater
    column 'Дата публикации', :publish_on
    actions
  end


  form partial: 'blog_article_form'
end

ActiveAdmin.register NewsArticle do
  permit_params(
    :body,
    :cover_image,
    :remove_cover_image,
    :small_cover_image,
    :remove_small_cover_image,
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
    :fixed,
    :type,
    :hidden,
    banners_attributes: [:id, :_destroy, :article_id, :title, :description, :url, :image, :position]
  )

  menu parent: "Статьи"

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

  collection_action :search, method: :get do
    tags = ActsAsTaggableOn::Tag.where('LOWER(name) ILIKE ?', "#{params[:term]}%")
    render json: tags, each_serializer: AutocompleteSerializer, root: false
  end

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
    column 'Дата изменения', :updated_at
    column 'Обновил', :updater
    column 'Дата публикации', :publish_on
    actions
  end

  form partial: 'news_article_form'

end

ActiveAdmin.register BlogsConfig do
  permit_params(
    :pinned_blogs,
    :spotlight_blogs,
    :main_blogs,
    :promoted_blogs,
    :title,
    :active
  )

  menu parent: "Page Configs", label: 'Blogs Page Configs'

  form do |f|
    f.inputs do
      f.input :title, label: 'Название'
      f.input :active, label: 'Активен'
      f.input(
        :pinned_blogs,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: BlogArticle.published.collect { |article| [article.title, article.id] }
      )
      f.input(
        :spotlight_blogs,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: BlogArticle.published.collect { |article| [article.title, article.id] }
      )
      f.input(
        :main_blogs,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: BlogArticle.published.collect { |article| [article.title, article.id] }
      )
      f.input(
        :promoted_blogs,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: BlogArticle.published.collect { |article| [article.title, article.id] }
      )
    end
    f.actions
  end

  index do
    def populate_articles(article_ids)
      articles = article_ids.map do |article_id|
        Article.exists?(article_id) ? Article.find(article_id) : nil
      end
      articles.compact
    end

    column :title
    column "Data" do |blogs_config|
      render 'admin/blogs_config_data', {
        pinned_blogs: populate_articles(blogs_config.data['pinned_blogs']),
        spotlight_blogs: populate_articles(blogs_config.data['spotlight_blogs']),
        main_blogs: populate_articles(blogs_config.data['main_blogs']),
        promoted_blogs: populate_articles(blogs_config.data['promoted_blogs'])
      }
    end
    column :active
    actions
  end

  controller do

    def filter_input_data(name)
      params[:blogs_config][name].reject(&:empty?)
    end

    def build_data
      @data = {
        pinned_blogs: filter_input_data(:pinned_blogs),
        spotlight_blogs: filter_input_data(:spotlight_blogs),
        main_blogs: filter_input_data(:main_blogs),
        promoted_blogs: filter_input_data(:promoted_blogs)
      }
    end

    def create
      build_data
      BlogsConfig.create(
        title: params[:blogs_config][:title], 
        data: @data,
        type: 'BlogsConfig',
        active: params[:blogs_config][:active]
      )
      redirect_to collection_url
    end

    def update
      build_data
      blogs_config = BlogsConfig.find(params[:id])
      blogs_config.update!({
        title: params[:blogs_config][:title],
        data: @data,
        type: 'BlogsConfig',
        active: params[:blogs_config][:active]
      })
      redirect_to collection_url
    end
  end
end
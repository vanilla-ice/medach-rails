ActiveAdmin.register MainConfig do
  permit_params(
    :pinned_articles,
    :pinned_blogs,
    :main_news,
    :promoted_articles,
    :title,
    :active
  )

  menu parent: "Page Configs", label: 'Main Page Configs'

  form do |f|
    f.inputs do
      f.input :title, label: 'Название'
      f.input :active, label: 'Активен'
      f.input(
        :pinned_articles,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: LongreadArticle.published.collect { |article| [article.title, article.id] }
      )
      f.input(
        :pinned_blogs,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: BlogArticle.published.collect { |article| [article.title, article.id] }
      )
      f.input(
        :main_news,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: NewsArticle.published.collect { |article| [article.title, article.id] }
      )
      f.input(
        :promoted_articles,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: LongreadArticle.published.collect { |article| [article.title, article.id] }
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
    column "Data" do |main_config|
      render 'admin/main_config_data', {
        pinned_articles: populate_articles(main_config.data['pinned_articles']),
        pinned_blogs: populate_articles(main_config.data['pinned_blogs']),
        main_news: populate_articles(main_config.data['main_news']),
        promoted_articles: populate_articles(main_config.data['promoted_articles'])
      }
    end
    column :active
    actions
  end

  controller do

    def filter_input_data(name)
      params[:main_config][name].reject(&:empty?)
    end

    def build_data
      @data = {
        pinned_articles: filter_input_data(:pinned_articles),
        pinned_blogs: filter_input_data(:pinned_blogs),
        main_news: filter_input_data(:main_news),
        promoted_articles: filter_input_data(:promoted_articles)
      }
    end

    def create
      build_data
      MainConfig.create(
        title: params[:main_config][:title], 
        data: @data,
        type: 'MainConfig',
        active: params[:main_config][:active]
      )
      redirect_to collection_url
    end

    def update
      build_data
      site_config = MainConfig.find(params[:id])
      site_config.update!({
        title: params[:main_config][:title],
        data: @data,
        type: 'MainConfig',
        active: params[:main_config][:active]
      })
      redirect_to collection_url
    end
  end
end
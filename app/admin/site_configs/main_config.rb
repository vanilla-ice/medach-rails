ActiveAdmin.register MainConfig do
  permit_params(
    :pinned_articles,
    :pinned_blogs,
    :main_news,
    :promoted_articles,
    :slider_articles,
    :title,
    :active
  )

  menu parent: 'Конфигурация страниц'

  form partial: 'main_config_form'

  index do
    def populate_articles(article_ids)
      Article.where(id: article_ids).sort_by { |article| article_ids.index(article.id) }
    end

    column 'Название', :title
    column 'Конфигурация' do |main_config|
      render 'admin/main_config_data', {
        pinned_articles: populate_articles(main_config.data['pinned_articles']),
        pinned_blogs: populate_articles(main_config.data['pinned_blogs']),
        main_news: populate_articles(main_config.data['main_news']),
        promoted_articles: populate_articles(main_config.data['promoted_articles']),
        slider_articles: populate_articles(main_config.data['slider_articles'])
      }
    end
    column 'Активен', :active
    actions
  end

  controller do

    def filter_input_data(name)
      params[:main_config][name].reject(&:empty?)
    end

    def process_order_field(name)
      order_string = params[:main_config][name]
      order_string.split(',').map{|s| s.delete(' ') }.reject(&:empty?)
    end

    def build_data
      @data = {
        pinned_articles: filter_input_data(:pinned_articles),
        pinned_articles_order: process_order_field(:pinned_articles_order),
        pinned_blogs: filter_input_data(:pinned_blogs),
        pinned_blogs_order: process_order_field(:pinned_blogs_order),
        main_news: filter_input_data(:main_news),
        main_news_order: process_order_field(:main_news_order),
        promoted_articles: filter_input_data(:promoted_articles),
        promoted_articles_order: process_order_field(:promoted_articles_order),
        slider_articles: filter_input_data(:slider_articles),
        slider_articles_order: process_order_field(:slider_articles_order)
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

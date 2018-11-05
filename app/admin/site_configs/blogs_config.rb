ActiveAdmin.register BlogsConfig do
  permit_params(
    :pinned_blogs,
    :spotlight_blogs,
    :main_blogs,
    :promoted_blogs,
    :title,
    :active
  )

  menu parent: 'Конфигурация страниц'

  form partial: 'blogs_config_form'

  index do
    def populate_articles(article_ids)
      Article.where(id: article_ids).sort_by { |article| article_ids.index(article.id) }
    end

    column 'Название', :title
    column 'Конфигурация' do |blogs_config|
      render 'admin/blogs_config_data', {
        pinned_blogs: populate_articles(blogs_config.data['pinned_blogs']),
        spotlight_blogs: populate_articles(blogs_config.data['spotlight_blogs']),
        main_blogs: populate_articles(blogs_config.data['main_blogs']),
        promoted_blogs: populate_articles(blogs_config.data['promoted_blogs'])
      }
    end
    column 'Активен', :active
    actions
  end

  controller do

    def filter_input_data(name)
      params[:blogs_config][name].reject(&:empty?)
    end

    def process_order_field(name)
      order_string = params[:blogs_config][name]
      order_string.split(',').map{|s| s.delete(' ') }.reject(&:empty?)
    end

    def build_data
      @data = {
        pinned_blogs: filter_input_data(:pinned_blogs),
        pinned_blogs_order: process_order_field(:pinned_blogs_order),
        spotlight_blogs: filter_input_data(:spotlight_blogs),
        spotlight_blogs_order: process_order_field(:spotlight_blogs_order),
        main_blogs: filter_input_data(:main_blogs),
        main_blogs_order: process_order_field(:main_blogs_order),
        promoted_blogs: filter_input_data(:promoted_blogs),
        promoted_blogs_order: process_order_field(:promoted_blogs_order),
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

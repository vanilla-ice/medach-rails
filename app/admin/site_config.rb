ActiveAdmin.register SiteConfig do
  permit_params(
    :pinned_articles,
    :promoted_articles,
    :pinned_blogs,
    :promoted_blogs,
    :title,
    :active
  )
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
        :promoted_articles,
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
        :promoted_blogs,
        as: :select,
        :input_html => { multiple: true, class: 'chosen-select' },
        collection: BlogArticle.published.collect { |article| [article.title, article.id] }
      )
    f.actions
    end
  end

  index do
    def populate_articles(article_ids)
      articles = article_ids.map do |article_id|
        Article.exists?(article_id) ? Article.find(article_id) : nil
      end
      articles.compact
    end

    column :title
    column "Data" do |site_config|
      render 'admin/site_config_data', { 
        pinned_articles: populate_articles(site_config.data['pinned_articles']),
        promoted_articles: populate_articles(site_config.data['promoted_articles']),
        pinned_blogs: populate_articles(site_config.data['pinned_blogs']),
        promoted_blogs: populate_articles(site_config.data['promoted_blogs']),
      }
    end
    column :active
    actions
  end

  controller do

    def filter_input_data(name)
      params[:site_config][name].reject(&:empty?)
    end

    def build_data
      @data = {
        pinned_articles: filter_input_data(:pinned_articles),
        promoted_articles: filter_input_data(:promoted_articles),
        pinned_blogs: filter_input_data(:pinned_blogs),
        promoted_blogs: filter_input_data(:promoted_blogs)
      }
    end

    def create
      build_data
      SiteConfig.create(
        title: params[:site_config][:title], 
        data: @data,
        active: params[:site_config][:active]
      )
      redirect_to collection_url
    end

    def update
      build_data
      site_config = SiteConfig.find(params[:id])
      site_config.update!({
        title: params[:site_config][:title],
        data: @data,
        active: params[:site_config][:active]
      })
      redirect_to collection_url
    end
  end

end
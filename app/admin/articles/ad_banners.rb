ActiveAdmin.register AdBanner do
  permit_params(
    :ad_type,
    :ad_position,
    :article_type,
    :link,
    :image,
    :google_id,
    ad_banners_articles_attributes: [:article_id]
  )

  menu parent: 'Статьи'

  before_action :modify_params, only: [:create, :update]

  controller do
    def modify_params
      article_ids = params[:ad_banner][:article_ids].reject { |id| id.empty? }
      params[:ad_banner].merge!({ ad_banners_articles_attributes: article_ids.map { |id| { article_id: id } } })
      params[:ad_banner] = params[:ad_banner].except(:article_ids)
    end
  end

  form partial: 'ad_banners_form'
end

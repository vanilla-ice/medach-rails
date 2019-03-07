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

  form do |f|
    f.inputs 'Содержимое' do
      f.input :ad_position
      f.input :ad_type, input_html: { data: { if: 'changed', action: 'callback on_change_ad_type' }, class: 'ad_type_select' }

      f.input :google_id, wrapper_html: { style: 'display: none', class: 'content_google' }
      f.input :link, wrapper_html: { style: 'display: none', class: 'content_custom' }
      f.input :image, wrapper_html: { style: 'display: none', class: 'content_custom' }
    end

    f.inputs 'Статьи' do
      f.input :article_type,
              as: :select,
              collection: Article::TYPES.map { |a_type| [I18n.t("activerecord.models.#{a_type.underscore}.many"), a_type] },
              input_html: { data: { if: 'changed', action: 'callback on_change_article_type' }, class: 'article_type_select' }

      f.input :article_ids, as: :select, collection: BlogArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_blog' }
      f.input :article_ids, as: :select, collection: CaseArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_case' }
      f.input :article_ids, as: :select, collection: LongreadArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_longread' }
      f.input :article_ids, as: :select, collection: MediaArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_media' }
      f.input :article_ids, as: :select, collection: NewsArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_news' }
    end

    f.actions
  end
end

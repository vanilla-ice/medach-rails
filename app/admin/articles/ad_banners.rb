ActiveAdmin.register AdBanner do
  permit_params(
    :ad_type,
    :ad_position,
    :article_type,
    :link,
    :image,
    :google_id,
    :blog_ids,
    :case_ids,
    :longread_ids,
    :media_ids,
    :news_ids
  )

  menu parent: 'Статьи'

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
              collection: Article::TYPES.map { |a_type| I18n.t("activerecord.models.#{a_type.underscore}.many") },
              input_html: { data: { if: 'changed', action: 'callback on_change_article_type' }, class: 'article_type_select' }

      f.input :blog_ids, as: :select, collection: BlogArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_blog' }
      f.input :case_ids, as: :select, collection: CaseArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_case' }
      f.input :longread_ids, as: :select, collection: LongreadArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_longread' }
      f.input :media_ids, as: :select, collection: MediaArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_media' }
      f.input :news_ids, as: :select, collection: NewsArticle.all, input_html: { multiple: true }, wrapper_html: { style: 'display: none', class: 'a_type article_news' }
    end

    f.actions
  end
end

class AdBannersArticle < ApplicationRecord
  belongs_to :ad_banner
  belongs_to :article
end

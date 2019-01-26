module Api
  class BaseController < ActionController::Base
    respond_to :json

    def meta_attributes(collection, extra_meta = {})
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }.merge(extra_meta)
    end
  end
end

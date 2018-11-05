module Sortable
  extend ActiveSupport::Concern

  module ClassMethods
    # TODO enhance to allow cross-table sorting
    def sort_query(sort_params)
      col = sort_params.try(:[], :col) || :created_at
      dir = sort_params.try(:[], :dir) || :asc
      self.order(col => dir)
    end
  end
end

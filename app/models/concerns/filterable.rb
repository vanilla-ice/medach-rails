module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        case key
        when 'tag' then results = results.tagged_with(value)
        when 'query' then results = search(value)
        else results = results.public_send(key, value) if value.present?
        end
      end
      results
    end
  end
end

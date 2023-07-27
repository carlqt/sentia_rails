module Queryable
  extend ActiveSupport::Concern

  class_methods do
    def search(category:, string:)
      where_statement = {}
      where_statement[category] = string

      self.where(where_statement)
    end
  end
end
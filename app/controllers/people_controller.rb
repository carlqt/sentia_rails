class PeopleController < ApplicationController
  def index
    @people = Person.all
    @categories = Person.column_names.reject { |name| %w(id created_at updated_at).include?(name) }
  end
end

class PeopleController < ApplicationController
  def index
    @people = Person
      .search(category: params[:category], string: params[:search])
      .order(params[:sort])
      .page(params[:page])
    @categories = Person.column_names.reject { |name| %w(id created_at updated_at).include?(name) }
  end
end

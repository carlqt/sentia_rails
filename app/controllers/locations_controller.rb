class LocationsController < ApplicationController
  def index
    @locations = Location
      .search(category: params[:category], string: params[:search])
      .order(params[:sort])
      .page(params[:page])
    @categories = Location.column_names.reject { |name| %w(id created_at updated_at).include?(name) }
  end
end

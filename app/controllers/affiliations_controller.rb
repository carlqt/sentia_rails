class AffiliationsController < ApplicationController
  def index
    @affiliations = Affiliation
      .search(category: params[:category], string: params[:search])
      .order(params[:sort])
      .page(params[:page])
    @categories = Affiliation.column_names.reject { |name| %w(id created_at updated_at).include?(name) }
  end
end

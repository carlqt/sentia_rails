class ImportersController < ApplicationController
  def new
  end

  def create
    flash[:success] = 'Import Successful'

    importer = Importer.new(params[:csv])
    importer.run

    redirect_to new_importer_path
  end
end

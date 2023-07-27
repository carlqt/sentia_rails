class ImportersController < ApplicationController
  def new
  end

  def create
    importer = Importer.new(params[:csv])
    importer.run

    if importer.errors.present? 
      flash[:alert] = importer.errors
    else
      flash[:success] = 'Successful Upload'
    end

    redirect_to new_importer_path
  end
end

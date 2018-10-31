class DefaultHealthRatingsController < ApplicationController
  def import
    @default_health_ratings = DefaultHealthRating.all
  end

  def import_csv
    uploaded_io = params[:file_upload].tempfile
    path = uploaded_io.path.to_s
    importer = Importers::DefaultHealthRatingsImporter.new(path, current_user)
    importer.call

    redirect_to import_default_health_ratings_path
  end
end

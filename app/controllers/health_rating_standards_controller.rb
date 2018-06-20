class HealthRatingStandardsController < ApplicationController
  def import
    @health_rating_standards = HealthRatingStandard.all
  end

  def import_csv
    uploaded_io = params[:ratings].tempfile
    path = uploaded_io.path.to_s
    importer = Importers::HealthRatingStandardsImporter.new(path)
    importer.call

    redirect_to import_health_rating_standards_path
  end
end

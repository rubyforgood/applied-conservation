require 'csv'

class HealthRatingStandardsController < ApplicationController
  def import
    @health_rating_standards = HealthRatingStandard.all
  end

  def import_csv
    uploaded_io = params[:ratings].tempfile
    path = uploaded_io.path.to_s
    CSV.read(path, headers: true).map(&:to_h).each do |attributes|
      target_type = TargetType.find_or_create_by!(name: attributes['target_type_name'])
      rating = attributes['rating_name']
      HealthRatingStandard.create!(target_type: target_type,
                                   rating: rating,
                                   description: attributes['description'],
      )
    end

    redirect_to import_health_rating_standards_path
  end
end

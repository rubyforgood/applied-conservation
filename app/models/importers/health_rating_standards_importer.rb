require 'csv'

module Importers
  class HealthRatingStandardsImporter
    def initialize(path)
      @path = path
    end

    def call
      CSV.read(@path, headers: true).map(&:to_h).each do |attributes|
        target_type = TargetType.find_or_create_by!(
          name: attributes['target_type_name']
        )
        rating = attributes['rating_name']
        HealthRatingStandard.create!(target_type: target_type,
                                     rating: rating,
                                     description: attributes['description'])
      end
    end
  end
end

require 'csv'

module Importers
  class DefaultHealthRatingsImporter
    def initialize(path, user)
      @path = path
      @user = user
    end

    def call
      CSV.read(@path, headers: true).map(&:to_h).each do |attributes|
        # {"target_type_name"=>"river",
        #  "health_attribute_name"=>"flow",
        #  "rating_name"=>"poor",
        #  "description"=>"there are blockages",
        #  "comments"=>"i googled it"}

        target_type = TargetType.find_or_create_by!(
          name: attributes['target_type_name'],
        )
        default_health_attribute = DefaultHealthAttribute.find_or_create_by!(
            name: attributes['health_attribute_name'],
            target_type: target_type,
            created_by: @user,
            updated_by: @user,
        )
        health_rating_type = HealthRatingType.find_or_create_by!(
            name: attributes['rating_name'],
            created_by: @user,
            updated_by: @user,
        )
        DefaultHealthRating.where(default_health_attribute: default_health_attribute,
                                  health_rating_type: health_rating_type,
                                  description: attributes['description']).
                            first_or_create!(author_note: attributes['comments'],
                                             created_by: @user,
                                             updated_by: @user,
        )
      end
    end
  end
end

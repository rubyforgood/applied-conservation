# frozen_string_literal: true

module ApplicationHelper
  def target_tab?
    return 'active' if [
      TargetsController,
      HealthAttributesController
    ].include?(request.controller_class)
    ''
  end
end

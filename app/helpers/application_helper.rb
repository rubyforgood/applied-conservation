# frozen_string_literal: true

module ApplicationHelper
  def target_tab?
    return 'active' if [
      TargetsController,
      HealthAssessmentsController
    ].include?(request.controller_class)
    ''
  end
end

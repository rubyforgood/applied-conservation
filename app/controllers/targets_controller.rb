# frozen_string_literal: true

class TargetsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @targets = @project.targets
  end
end

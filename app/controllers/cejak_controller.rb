class CejakController < ApplicationController
  def index
  end

  def show
    render params[:project_name]
  end

  def controller_class
    'cejak'
  end
end
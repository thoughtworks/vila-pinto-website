class CejakController < ApplicationController
  def index
  end

  def show
    render params[:project_name]
  end

  def projects
    @community_projects = Project.find_all_by_category Project::CATEGORY_COMMUNITY
    @children_teenagers_projects = Project.find_all_by_category Project::CATEGORY_CHILDREN_AND_TEENAGERS
  end

  def sponsors
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_CEJAK
  end

  def transparency
    @reports = FinancialReportDecorator.order("name DESC").find_all_by_type(FinancialReport::TYPE_CEJAK)
  end

  def controller_class
    'cejak'
  end
end

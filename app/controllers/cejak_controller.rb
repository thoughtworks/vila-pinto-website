class CejakController < ApplicationController
  def index
  end

  def project_show
    @project = Project.where(:url => params[:url]).first.decorate
  end

  def projects
    @community_projects = Project.where :category => Project::CATEGORY_COMMUNITY, :visible => true
    @children_teenagers_projects = Project.where :category => Project::CATEGORY_CHILDREN_AND_TEENAGERS, :visible => true
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

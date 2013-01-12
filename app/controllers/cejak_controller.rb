class CejakController < ApplicationController
  def index
  end

  def show
    render params[:project_name]
  end

  def transparency
    @reports = FinancialReportDecorator.order("name DESC").find_all_by_type(FinancialReport::TYPE_CEJAK)
  end

  def controller_class
    'cejak'
  end
end

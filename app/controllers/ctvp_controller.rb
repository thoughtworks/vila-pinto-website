class CtvpController < ApplicationController
  layout "application"

  def index
  end

  def materiais
  end

  def sponsors
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_CTVP
  end

  def transparency
    @reports = FinancialReportDecorator.order("name DESC").find_all_by_type(FinancialReport::TYPE_CTVP)
  end

  def controller_class
    'ctvp'
  end
end

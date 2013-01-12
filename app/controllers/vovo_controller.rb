class VovoController < ApplicationController
  def index
  end

  def controller_class
    'vovo'
  end

  def sponsors
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_VOVO_BELINHA
  end

  def transparency
    @reports = FinancialReportDecorator.order("name DESC").find_all_by_type(FinancialReport::TYPE_VOVO_BELINHA)
  end
end

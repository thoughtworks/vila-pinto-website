class WelcomeController < ApplicationController
  def index
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_CEA
    @reports = FinancialReportDecorator.order("name DESC").find_all_by_type(FinancialReport::TYPE_CEA)
  end

  def controller_class
    "cea"
  end

  def social_balance
    @reports = FinancialReportDecorator.order("name DESC").find_all_by_type(FinancialReport::TYPE_CEA)
  end

end

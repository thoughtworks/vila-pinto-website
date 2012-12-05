class CtvpController < ApplicationController
  layout "application"

  def index
  end

  def materiais
  end
  
  def controller_class
    'ctvp'
  end
  
  def sponsors
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_CTVP
  end
end

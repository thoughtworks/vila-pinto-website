class VovoController < ApplicationController
  def index
  end
  
  def controller_class
    'vovo'
  end
  
  def sponsors
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_VOVO_BELINHA
  end
end

class WelcomeController < ApplicationController
  def index
    @partners = PartnerDecorator.find_all_by_type Partner::TYPE_CEA
  end

  def controller_class
  	"cea"
  end
end

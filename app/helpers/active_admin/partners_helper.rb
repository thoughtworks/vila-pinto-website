module ActiveAdmin::PartnersHelper
  def type_options
    Partner.types.map do |type|
      [translate_type(type),type]
    end      
  end
  
  def translate_type type
    I18n.t "partner.type.#{type}" 
  end
  
end
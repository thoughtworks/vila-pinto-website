module ActiveAdmin::PartnersHelper
  def partner_type_options
    Partner.types.map do |type|
      [translate_partner_type(type),type]
    end      
  end
  
  def translate_partner_type type
    I18n.t "partner.type.#{type}" 
  end
  
  def partner_image_info(form)
    return if form.object.image.nil? || form.object.image.file.nil?
    form.template.image_tag(form.object.image.url)
    #form.object.image.file.filename
  end
  
end
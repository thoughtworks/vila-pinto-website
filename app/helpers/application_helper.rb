module ApplicationHelper
  def translate_type type
    I18n.t "type.#{type}" 
  end
end

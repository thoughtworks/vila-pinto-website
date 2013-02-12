module ApplicationHelper
  def translate_type type
    I18n.t "type.#{type}" 
  end

  def translate_category category
    I18n.t "category.#{category}" 
  end

end

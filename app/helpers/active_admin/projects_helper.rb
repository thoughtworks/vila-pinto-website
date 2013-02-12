module ActiveAdmin::ProjectsHelper
  def project_category_options
    Project.categories.map do |category|
      [translate_category(category),category]
    end
  end
end

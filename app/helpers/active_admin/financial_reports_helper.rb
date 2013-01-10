module ActiveAdmin::FinancialReportsHelper
  def financial_reports_type_options
    FinancialReport.types.map do |type|
      [translate_type(type),type]
    end
  end

  def financial_report_file(form)
    return if form.object.file.nil? || form.object.file.file.nil?
    form.template.link_to(I18n.t(:file), form.object.file.url)
  end
end

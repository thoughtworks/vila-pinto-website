class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :controller_class

  before_filter :set_locale_from_url

  private

  def controller_class
    'cea'
  end
end
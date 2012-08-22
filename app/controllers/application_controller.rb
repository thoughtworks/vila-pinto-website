class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale_from_url
end

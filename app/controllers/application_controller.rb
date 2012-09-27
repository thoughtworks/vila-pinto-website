class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale_from_url

#  before_filter :authenticate, :if => :production_mode?

  private

  def production_mode?
    Rails.env.production?
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BETA_USER'] && password == ENV['BETA_PASSWORD']
    end
  end
end

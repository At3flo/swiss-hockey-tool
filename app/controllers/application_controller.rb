class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :set_locale
  # before_action :set_locale

  rescue_from ActionController::UnpermittedParameters do |error|
    message = "Invalid parameter: %s. " % error.params.to_sentence
    message << 'Please verify that the parameter name is valid and the values are the correct type.'
    render_error 'param_error', :status => :bad_request, :locals => { :exception => error, :message => message }
  end

  private
  
  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end
  
  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options
    { locale: I18n.locale }
  end
end

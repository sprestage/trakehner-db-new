class ApplicationController < ActionController::Base

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

    def default_url_options
    { locale: I18n.locale }
  end


  # before_filter :set_locale
  # 
  # private
  #
  # def set_locale
  #   if params[:locale].present?
  #     # puts '-----------@@@@@@@@@@@@-------------'
  #     # puts "params[:locale] received, equal to #{ params[:locale]
  #     # puts '-----------@@@@@@@@@@@@-------------'}"
  #     I18n.locale = params[:locale]
  #   end
  # end
  #
  # def default_url_options(options = {})
  #   logger.debug "default_url_options is passed options: #{options.inspect}\n"
  #   { locale: I18n.locale }
  # end

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :layouts

  def layouts
    @header = Template.find_by_name("header")
    @footer = Template.find_by_name("footer")
  end


  private

  def set_admin_locale
  I18n.locale = params[:locale] || :ru
  end
  
end

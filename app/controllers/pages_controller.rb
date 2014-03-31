class PagesController < ApplicationController

  def show
    @page = Page.find_by_slug(params[:slug]) || Page.find(params[:slug])
    @menu_tech = Page.where(["parent_id = ?", Page.find_by_slug("technology")])
    @menu_bleach = Page.where(["parent_id = ?", Page.find_by_slug("index")])
    @news = News.last(2)
    @history = Page.where(["parent_id = ?", Page.find_by_slug("history")])
    render params[:slug].scan(/[a-z]/).join if controller_view_exists?(params[:slug].scan(/[a-z]/).join)
  end

  private

  def view_exists?(view)
    File.exists? Rails.root.join("app", "views", view)
  end

  def controller_view_exists?(name)
    view_exists?("#{params[:controller]}/#{name}.html.erb")
  end

  def layout_exists?(name)
    view_exists?("layouts/#{name}.html.erb")
  end
end

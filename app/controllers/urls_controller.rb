class UrlsController < ApplicationController

  def index
  @url = Url.new
    if current_user
      @urls = current_user.urls
    elsif session[:url_ids] and session[:url_ids].any?
      @urls = Url.find(session[:url_ids])
    else
      @urls = []
    end
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])
    Url.where(:id => @url.id).update_all("page_views = page_views + 1")
    redirect_to @url.original_url
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params[:url])
    @url.user = current_user

    if @url.save
      if session[:url_ids]
        session[:url_ids] << @url.id
      else
        session[:url_ids] = [@url.id]
      end
      redirect_to urls_path
    else
      render 'new'
    end
  end
end

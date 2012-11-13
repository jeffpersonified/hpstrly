class UrlsController < ApplicationController

  def index
    @urls = current_user ? current_user.urls : session[:urls]
  end

  def show
    Url.where(:id => @url.id).update_all("page_views = page_views + 1")

    redirect_to @url.original_url

    # @url.increment(:page_views)
    # RACE CONDITION!
    # ---- new request comes in here
    # @url.save
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params[:url])
    @url.user = current_user


    if @url.save
      if session[:urls]
        session[:urls] << @url
      else
        session[:urls] = [@url]
      end
      redirect_to urls_path
    else
      render 'new'
    end
  end
end

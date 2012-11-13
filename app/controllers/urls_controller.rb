class UrlsController < ApplicationController

  def index
    @urls = current_user ? Url.where(:user_id => current_user.id) : []
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])

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
      redirect_to urls_path
    else
      render 'new'
    end
  end
end

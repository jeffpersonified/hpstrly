class UrlsController < ApplicationController

  def index
    @urls = Url.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @urls }
    end
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])
    @url.page_views += 1
    @url.save
    redirect_to @url.original_url
  end

  def new
    @url = Url.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url }
    end
  end
  
  def create
    @url = Url.new(params[:url])

    respond_to do |format|
      if @url.save
        format.html { redirect_to action: 'index', notice: 'url was successfully created.' }
        format.json { render json: @url, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

end

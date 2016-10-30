class LinksController < ApplicationController
  before_action :authenticate_user!, only: :new

  # GET /links
  def index
    @links = Link.all
  end

  # GET /links/1
  def show
    @link = Link.find(params[:id])
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links

  def create
      @link = Link.new(link_params)
      if @link.save
        redirect_to @link, notice: 'Link was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /links/1

  def update
      @link = Link.find(params[:id])
      if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
      else
      render :edit
      end
  end

  # DELETE /links/1

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
      redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end
end

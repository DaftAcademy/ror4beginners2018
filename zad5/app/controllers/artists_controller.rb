class ArtistsController < ApplicationController
  before_action :set_artists_collection, only: %i[new edit create update]

  def show
    @artist = Artist.find(params[:id])
  end

  def index
  	@artists = Artist.all
  end

  def new
  	@artist = Artist.new
  end

  def create
  	@artist = Artist.new(artist_params)
  	if @artist.save
  	  redirect_to artists_url, notice: 'Artist has been saved'
  	else
  	  render 'new'
  	end
  end

  def edit
    @artist = Artist.find(params[:id])
    render 'edit'
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_url, notice: 'Artist has been updated'
    else
      render 'edit'
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_url, notice: 'Artist has been wiped out'
  end

  private

  def set_artists_collection
    @artist = Artist.find_by_id(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :id)
  end
end

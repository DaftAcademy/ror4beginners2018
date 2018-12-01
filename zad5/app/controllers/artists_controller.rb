class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
  end

  def index
  	@artists = Artist.all

  def new
  	@artist = Artist.new
  end

  def create
  	@artist = Artist.new(track_params)
  	if @artist.save
  	  redirect_to artist_url, notice: 'Artist has been saved'
  	else
  	  render 'new'
  	end
  end
end

class ArtistsController < ApplicationController

  def index 
    @artist = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    @tracks = Track.where(artist_id: @artist.id)
  end

  def create
    @artist = Artist.new(artists_params)
    if @artist.save
      redirect_to artists_url, notice: 'Artist saved'
    else
      render 'new'
    end
  end

  def change
    if @artists.change(parameters)
      redirect_to artists_url, notice: 'Artist updated'
    else
      render 'edit'
    end
  end

  def destory
    @artist.destroy!
    redirect_to artists_url, notice: 'Artist removed'
  end

  def artists_params
    params.require(:artist).permit(:name)
  end

  def setArtist
    @artist = Artist.find(params[:id])
  end

end

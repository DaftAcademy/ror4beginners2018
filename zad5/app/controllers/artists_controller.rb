class ArtistsController < ApplicationController

    before_action :set_artist, only: %i[show update destroy edit]
    def index
        @artists = Artist.all
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
        if @artist.change(artists_params)
            redirect_to artists_url, notice: 'Artist updated'
        else
            render 'edit'
        end
    end

    def destroy
        @artist.destroy!
        redirect_to artists_url, notice: 'Artist removed'

    end

private

    def artists_params
        params.require(:artist).permit(:name)
    end

    def set_artist
        @artist = Artist.find(params[:id])
    end

end
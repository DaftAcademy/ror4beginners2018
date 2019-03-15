class ArtistsController < ApplicationController
    before_action :set_artist, only: %i[show update destroy edit]

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def show       
    end

    def destroy
        @artist.destroy!
        redirect_to artists_url, notice: "Artist has been deleted"
    end

    def create
        @artist = Artist.create(artist_params)
        if @artist.persisted?
            redirect_to artists_path
        else
            render :new, notice: 'Artist has been saved'
        end
    end

    def edit
        render :new
    end

    def update
        if @artist.update(artist_params)
            redirect_to artists_path, notice: 'Artist has been updated'
        else
            render :edit
        end
    end

    private

    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name)
    end
end

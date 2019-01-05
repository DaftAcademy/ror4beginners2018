class ArtistsController < ApplicationController
    before_action :set_artist, only: %i[show update destroy edit]
      def index
        @artists = Artist.all
      end

      def new
        @artist = Artist.new
      end

    def create
        @artist = Artist.create(artist_params)
        if @artist.save
            redirect_to artists_url, notice: 'Artist has been created'
        else
            render 'new'
        end
    end

    def update
        if @artist.update(artist_params)
            redirect_to artists_url, notice: 'Artist has been updated'
        else
            render 'edit'
        end
    end

    def destroy
        @artist.destroy!
        redirect_to artists_url, notice: 'Artist has been removed'
    end

    def edit
        render 'edit'
    end

    def show
        @artist = Artist.find(params[:id])
      end

      private

      def artist_params
        params.require(:artist).permit(:name)
      end

      def set_artist
        @artist = Artist.find(params[:id])
      end

end

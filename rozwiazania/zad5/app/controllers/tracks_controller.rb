# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :set_track, only: %i[show update destroy edit]
  before_action :set_artists_collection, only: %i[new edit update create]

  def index
    @tracks = Track.includes(:artist)
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to tracks_url, notice: 'Track has been saved'
    else
      render 'new'
    end
  end

  def update
    if @track.update(track_params)
      redirect_to tracks_url, notice: 'Track has been updated'
    else
      render 'edit'
    end
  end

  def destroy
    @track.destroy!
    redirect_to tracks_url, notice: 'Track has been removed'
  end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def set_artists_collection
    @artists = Artist.pluck(:name, :id)
  end

  def track_params
    params.require(:track).permit(:title, :artist_id)
  end
end

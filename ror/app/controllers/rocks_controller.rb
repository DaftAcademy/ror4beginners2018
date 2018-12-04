class RocksController < ApplicationController
  def index
    @rocks = Rock.all
  end

  def show
    @rock = Rock.find(params[:id])
  end

  def new
    @rock = Rock.new
  end

  def create
    @rock = Rock.create(rock_params)
    if @rock.persisted? #sprawdza czy obiekt istnieje w bazie danych
      redirect_to rocks_path
    else
      render :new
    end
  end

  def edit
    @rock = Rock.find(params[:id])
    render :new
  end

  def update
    @rock = Rock.find(params[:id])
    if @rock.update(rock_params) #update zwraca 0, 1 w zależności czy udalo sie zrobić update czy nie
      redirect_to rocks_path
    else
      render :new
    end
  end

  def destroy
    Rock.destroy(params[:id])
    redirect_to rocks_path
  end

  private

  def rock_params
    params.require(:rock).permit(:nickname, :weight) #filtruje jakie parametry może podać użytkownik
  end
end

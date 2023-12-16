class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by!(slug: params[:id])
  end


end

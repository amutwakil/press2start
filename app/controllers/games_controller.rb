class GamesController < ApplicationController
  before_action :load_form_elements_for_render, only: [:update, :create]
  def index #displays ALL games
    @games = Game.all
  end

  def show #displaying an existing game

    @game = Game.find_by!(slug: params[:id])

  end
  def new #the form for a game review (all fields EMPTY)

    @game = Game.new

  end
  def create #the POST for creating a game

    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit #the form for a game review (contains EXISTING data)
    @game = Game.find_by!(slug: params[:id])
  end

  def update #the PATCH for updating an existing game

    @game = Game.find_by!(slug: params[:id])

    if @game.update(game_params)
      redirect_to @game
    else
      # calling my private method that basically instantiates some local variables for my textfields I need logic for
      load_form_elements_for_render
      render :edit, status: :unprocessable_entity
    end
  end

  def search
    #I want 3 scenarios:
    # 1-query too short
    # 2-query results in no reviews returned
    # 3-query results in one or more reviews returned
    @query = params[:title]

    if @query.length >= 2
      if Game.where("title LIKE ?", "%#{@query}%").present?
        @games = Game.where("title LIKE ?", "%#{@query}%")
      else
        @games = "no reviews"
      end
    else
      @games = "too short"
    end
  end

  def home

    # displaying 'top 3 latest reviews' (simple enough, query for the 'first 3' after sorting by 'created_at')
    # displaying 'top 3 most coveted' (not so simple. how we going to flag this? add a col in my reviews for coveted maybe? 🤔)

  end
  def new_arrivals

    @games = Game.order(created_at: :desc)

  end


  private
  def load_form_elements_for_render
    #variables so I can refer to form elements by their names (directly below)
    @platform_textfield_reference = "game.platform_attributes.display_name"
    @developer_textfield_reference = "game.developer_attributes.display_name"
    @publisher_textfield_reference = "game.publisher_attributes.display_name"

    @platform_checkbox = params[:platform_id_checkbox]
    @developer_checkbox = params[:developer_id_checkbox]
    @publisher_checkbox = params[:publisher_id_checkbox]

    #variables so I can refer to text elements by their values
    @platform_textfield_value = params.dig(*@platform_textfield_reference.split('.')) if params.dig(*@platform_textfield_reference.split('.'))
    @developer_textfield_value = params.dig(*@developer_textfield_reference.split('.')) if params.dig(*@developer_textfield_reference.split('.'))
    @publisher_textfield_value = params.dig(*@publisher_textfield_reference.split('.')) if params.dig(*@publisher_textfield_reference.split('.'))
  end
  # 📶📶📶
  def game_params
    #:rating_set_attributes[:endgame_appeal_rating_attributes, ... ]
    params.require(:game).permit(:title, :summary, :year, :review, :genre_id,
                                 :publisher_id, :developer_id, :platform_id, :cover_art,
                                 developer_attributes: [:display_name],
                                 platform_attributes: [:display_name],
                                 publisher_attributes: [:display_name],
                                 rating_set_attributes: [:fun_factor_rating_id, :endgame_appeal_rating_id, :replayability_rating_id])
  end

end

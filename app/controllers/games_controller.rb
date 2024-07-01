class GamesController < ApplicationController
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
    #game.platform.name
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private
  # 📶📶📶
  def game_params
    params.require(:game).permit(:title, :summary, :year, :review, :genre_id, :publisher_id, :developer_id, :platform_id, developer_attributes: [:name], platform_attributes: [:name], publisher_attributes: [:name])
  end

  def check_for_attr_errors
    attr_errors = true
    @associated_attributes.each do |outer_k, nested_k|
      attr_errors = false if @game.errors.added?(nested_k[:association])
    end
    attr_errors
  end

  def inputs_included? #1
    #performing an initial check to see if we even included any inputs. no need to waste time if not.
    inputs_array = [:new_platform, :new_developer, :new_publisher]
    inputs_array.any? do |input|
      if params[:game][input].present?
        #we expand this to store the 'textfield' value of the present input in a variable so we can use in the view
        case input
          when :new_platform
          @stored_plat_value = params[:game][input]
          puts "here's the stored value: #{@stored_plat_value}"
          when :new_developer
          @stored_dev_value = params[:game][input]
          when :new_publisher
          @stored_pub_value = params[:game][input]
        end
        puts "this input is provided: #{params[:game][input]}"
        true
      end
    end
  end

  def scrub_inputs #2
    #iterates through the outer hash, and then refers to the the nested hash by 'keys' - platform, etc.
    @associated_attributes.each do |outer_k, nested_k|
      #we then check each association (i.e key) to see if we've provided an input for it
      if params[:game][nested_k[:input_name]].present?
        #if so, we scrub the whitespace (in place)
        params[:game][nested_k[:input_name]].strip!
        #then we flag the V @ K = true -> so we can refer to it later & know it was part of the POST data
        nested_k[:input_included] = true
      end
    end
  end

  def check_if_inputs_exists_in_db #3
    #once more we iterate through the hash, referring to the nested keys
    @associated_attributes.each do |outer_k, nested_k|
      #extracting: input_included, association(attribute_name), model, input_name
      input_name, input_included, association, model= nested_k[:input_name], nested_k[:input_included], nested_k[:association], nested_k[:model]
      #but we only bother performing checks & taxing with a DB query if we actually attempted to create a new association
      if input_included
        query = params[:game][input_name].downcase
        if model.find_by(backend_name: query)
          @game.errors.delete(association)
          @game.errors.add(association, "already exists. Select it in the dropdown")
        else
          @game.errors.delete(association)
        end
      end
    end
  end

end


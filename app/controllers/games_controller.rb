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

    attrs_to_modify = check_for_attr_errors

    if @game.save
      redirect_to @game
    else
      modify_validations_for_attributes attrs_to_modify
      render :new, status: :unprocessable_entity
    end
  end

  def edit #the form for a game review (contains EXISTING data)
    @game = Game.find_by!(slug: params[:id])
  end

  def update #the PATCH for updating an existing game

    @game = Game.find_by!(slug: params[:id])

    attrs_to_modify = check_for_attr_errors

    if @game.update(game_params)
      redirect_to @game
    else
      modify_validations_for_attributes attrs_to_modify
      render :edit, status: :unprocessable_entity
    end
  end

  def check_for_attr_errors
    #add whatever other 'new' attributes you wanna check for later in this controller
    #just push to the array
    attrs_to_modify = []
    if params[:game][:new_platform].present?
      if Platform.exists?(name: params[:game][:new_platform])
        attrs_to_modify << :platform
      else
        new_platform = Platform.create(name: params[:game][:new_platform])
        params[:game][:platform_id] = new_platform.id
      end
    end
    if params[:game][:new_developer].present?
      if Developer.exists?(name: params[:game][:new_developer])
        attrs_to_modify << :developer
      else
        new_developer = Developer.create(name: params[:game][:new_developer])
        params[:game][:developer_id] = new_developer.id
      end
    end
    if params[:game][:new_publisher].present?
      if Publisher.exists?(name: params[:game][:new_publisher])
        attrs_to_modify << :publisher
      else
        new_publisher = Publisher.create(name: params[:game][:new_publisher])
        params[:game][:publisher_id] = new_publisher.id
      end
    end
    attrs_to_modify
  end

  def modify_validations_for_attributes attrs
    attrs.each do |attr|
      @game.errors.delete(attr)
      @game.errors.add(attr, "already exists")
    end
  end

  private
  # 📶📶📶
  def game_params
    params.require(:game).permit(:title, :summary, :year, :review, :genre_id, :publisher_id, :developer_id, :platform_id)
  end

end


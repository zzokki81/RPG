# Character Controller
class CharactersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show, :index]
  before_action  only: [:show, :edit, :update, :destroy]

  def index
     @characters = Character.page params[:page]
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id

    if @character.save
      redirect_to @character, notice: "Character was created successfully!"
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html do
          redirect_to(@character, notice: "Character was successfully updated.")
        end

      else
        render 'edit'
      end
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_path, notice: 'Post was successfully destroyed'
  end

  private

  def character_params
    params.require(:character).permit(:name, :image, char_attributes_attributes: [:name, :value, :avatar_icon, :_destroy])
  end
end

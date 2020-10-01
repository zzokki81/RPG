# Character Controller
class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :can_modify_character, only: [:edit, :update, :destroy]

  def index
    @characters = Character.page params[:page]
  end

  def show
  end

  def new
    @character = Character.new
    @character.char_attributes.build
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

  def set_character
    @character = Character.find(params[:id])
  end

  def can_modify_character
    redirect_back(fallback_location: characters_path, notice: 'You are not authorized to edit this character!') unless @character.user_id == current_user.id
  end

  def character_params
    params.require(:character).permit(:name, :image, char_attributes_attributes: [:name, :value, :avatar_icon, :_destroy])
  end
end

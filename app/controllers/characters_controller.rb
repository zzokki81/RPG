class CharactersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :can_modify_character, only: [:edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.page params[:page]
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    # do nothing
  end

  # GET /characters/new
  def new
    @character = Character.new
    @character.char_attributes.build
  end

  # GET /characters/1/edit
  def edit
    # do nothing
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id

    if @character.save
      redirect_to @character, notice: "Character was created successfully!"
    else
      render 'new'
    end
  end
  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html do
          redirect_to(@character, :notice => "Character was successfully updated.")
        end
        format.json { render(:show, :status => :ok, :location => (@character)) }
      else
        format.html { render(:edit) }
        format.json do
          render(:json => @character.errors, :status => :unprocessable_entity)
        end
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
     @character.destroy
     redirect_to characters_path, notice: 'Post was successfully destroyed'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  def can_modify_character
    redirect_back(fallback_location: characters_path) unless @character.user_id == current_user.id
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name, :image, :char_attributes_attributes => ([:name, :value, :avatar_icon, :_destroy]))
  end
end

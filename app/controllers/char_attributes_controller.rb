# Char_Attributes Controller
class CharAttributesController < ApplicationController
  load_and_authorize_resource :character
  load_and_authorize_resource :char_attribute, through: :character
  before_action(:set_character)
  before_action(:set_char_attribute, only: [:update, :destroy])

  def create
    @char_attribute = @character.char_attributes.build(char_attribute_params)
    respond_to do |format|
      if @char_attribute.save
        format.js
        format.html do
          redirect_to(@chaaracter, notice: "Char attribute was successfully created.")
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @char_attribute.update(char_attribute_params)
        format.js
        format.html do
          redirect_to(@character, notice: "Char attribute was successfully updated.")
        end
      else
        render 'edit'
      end
    end
  end

  def destroy
    @char_attribute.destroy
    respond_to do |format|
      format.js
      format.html do
        redirect_to(char_attributes_url, notice: "Char attribute was successfully destroyed.")
      end
    end
  end

  private

  def set_char_attribute
    @char_attribute = CharAttribute.find(params[:id])
  end

  def char_attribute_params
    params.require(:char_attribute).permit(:name, :value, :avatar_icon, :character_id)
  end

  def set_character
    @character = Character.find(params[:character_id])
  end
end

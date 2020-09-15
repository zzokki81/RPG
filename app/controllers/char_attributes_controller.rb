class CharAttributesController < ApplicationController
  before_action(:get_character)
  before_action(:set_char_attribute, :only => ([:show, :edit, :update, :destroy]))
  before_action(:require_same_user, :only => ([:edit, :update, :destroy]))

  def index
    @char_attributes = CharAttribute.all
  end

  def show
  end

  def new
    @char_attribute = CharAttribute.new
  end

  def edit
  end

  def create
    @char_attribute = @character.char_attributes.build(char_attribute_params)
    respond_to do |format|
      if @char_attribute.save
        format.js
        format.html do
          redirect_to(@char_attribute, :notice => "Char attribute was successfully created.")
        end
        format.json do
          render(:show, :status => :created, :location => (@char_attribute))
        end
      else
        format.js
        format.html { render(:new) }
        format.json do
          render(:json => @char_attribute.errors, :status => :unprocessable_entity)
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @char_attribute.update(char_attribute_params)
        format.js
        format.html do
          redirect_to(@char_attribute, :notice => "Char attribute was successfully updated.")
        end
        format.json { render(:show, :status => :ok, :location => (@char_attribute)) }
      else
        format.html { render(:edit) }
        format.json do
          render(:json => @char_attribute.errors, :status => :unprocessable_entity)
        end
      end
    end
  end

  def destroy
    @char_attribute.destroy
    respond_to do |format|
      format.js
      format.html do
        redirect_to(char_attributes_url, :notice => "Char attribute was successfully destroyed.")
      end
      format.json { head(:no_content) }
    end
  end

  private

  def set_char_attribute
    @char_attribute = CharAttribute.find(params[:id])
  end

  def char_attribute_params
    params.require(:char_attribute).permit(:name, :value, :avatar_icon, :character_id)
  end

  def get_character
    @character = Character.find(params[:character_id])
  end

  def require_same_user
    redirect_to(characters_path) if (current_user != @character.user)
  end
end

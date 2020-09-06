class CharAttributesController < ApplicationController
  before_action :set_char_attribute, only: [:show, :edit, :update, :destroy]

  # GET /char_attributes
  # GET /char_attributes.json
  def index
    @char_attributes = CharAttribute.all
  end

  # GET /char_attributes/1
  # GET /char_attributes/1.json
  def show
  end

  # GET /char_attributes/new
  def new
    @char_attribute = CharAttribute.new
  end

  # GET /char_attributes/1/edit
  def edit
  end

  # POST /char_attributes
  # POST /char_attributes.json
  def create
    @char_attribute = CharAttribute.new(char_attribute_params)

    respond_to do |format|
      if @char_attribute.save
        format.html { redirect_to @char_attribute, notice: 'Char attribute was successfully created.' }
        format.json { render :show, status: :created, location: @char_attribute }
      else
        format.html { render :new }
        format.json { render json: @char_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /char_attributes/1
  # PATCH/PUT /char_attributes/1.json
  def update
    respond_to do |format|
      if @char_attribute.update(char_attribute_params)
        format.html { redirect_to @char_attribute, notice: 'Char attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @char_attribute }
      else
        format.html { render :edit }
        format.json { render json: @char_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /char_attributes/1
  # DELETE /char_attributes/1.json
  def destroy
    @char_attribute.destroy
    respond_to do |format|
      format.html { redirect_to char_attributes_url, notice: 'Char attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_char_attribute
      @char_attribute = CharAttribute.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def char_attribute_params
      params.require(:char_attribute).permit(:name, :value, :avatar_icon)
    end
end

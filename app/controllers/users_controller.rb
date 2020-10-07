# Users Controller
class UsersController < ApplicationController
  load_and_authorize_resource
  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)
  end

  def profile
    @user = User.find(params[:id]) if User.exists?(params[:id].to_i)
  end
end

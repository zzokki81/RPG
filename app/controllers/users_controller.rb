class UsersController < ApplicationController
  before_action :correct_user
  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)
  end

  def profile
    @user = User.find(params[:id]) if User.exists?(params[:id])
  end

  def correct_user
    unless current_user && params[:id].to_i == current_user.id
      redirect_to(root_path, notice: "You don't have permission to see other users accounts!")
    end
  end
end

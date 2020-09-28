class UsersController < ApplicationController
  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)
  end

  def profile
    @user = User.find(params[:id])
  end
end

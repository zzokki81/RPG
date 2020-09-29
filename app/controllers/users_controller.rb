class UsersController < ApplicationController
  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)
  end

  def profile
    respond_to do |format|
      if User.exists?(params[:id])
        @user = User.find(params[:id])
        format.html
      else
        format.html { redirect_to root_path, notice: 'User does not exist!' }
      end
    end
  end
end

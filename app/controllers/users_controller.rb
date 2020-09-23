class UsersController < ApplicationController
  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to(root_url, :notice => "User deleted.") if @user.destroy
  end
end

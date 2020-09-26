class UsersController < ApplicationController
  before_action :correct_user, only: [:destroy]

  def show
    @user = current_user
    @user_characters = @user.characters.order(:name).page(params[:page]).per(3)
  end

  def destroy
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to(root_url, notice: "You are not authorised to delete account!") and return
    end
    unless @user.destroy
      redirect_to(root_url, notice: "Error!. Account is not deleted!") and return
    end
    redirect_to(root_url, notice: "Success! Account is deleted!")
  end

  def profile
    @user = User.find(params[:id])
  end

  private

  def correct_user
    @user =User.find(params[:id])
  end
end

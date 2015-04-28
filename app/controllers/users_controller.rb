class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def create
    @user = User.create( user_params )
  end
  
  private
    # Be sure to update your create() and update() controller methods.
  
  def user_params
    params.require(:user).permit(:avatar)
  end
end

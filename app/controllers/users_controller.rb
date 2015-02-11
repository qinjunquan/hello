class UsersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.create(:nick_name => params[:user][:nick_name])
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.nick_name = params[:user][:nick_name]
    @user.coin_count = params[:user][:coin_count]
    @user.save
    redirect_to user_path(@user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy if user.present?
    redirect_to users_path
  end
end

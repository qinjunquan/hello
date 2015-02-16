class ChaoUsersController < ApplicationController
 
  def new
    @user = ChaoUser.new
  end
  
  def create
    @user = ChaoUser.new(user_params)
    if @user.save
      redirect_to @user
	else
	  render 'new'
	end
  end

  def index
    @users = ChaoUser.all
  end
 
  def show 
    @user = ChaoUser.find(params[:id])
  end

  def edit
    @user = ChaoUser.find(params[:id])
  end

  def update
    @user = ChaoUser.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
	else
	  render 'edit'
 	end
  end

  def destroy
    @user = ChaoUser.find(params[:id])
    @user.destroy
    redirect_to chao_users_path
  end

private
  def user_params

    params.require(:chao_user).permit(:nick_name)
  end

end

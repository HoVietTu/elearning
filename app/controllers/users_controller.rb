class UsersController < ApplicationController

  def show
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user.not_found"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def following
    @title = t "follow.following"
    @user  = User.find params[:id]
    @users = @user.following.paginate page: params[:page], per_page: 10
    render :show_follow
  end

  def followers
    @title = t "follow.followers"
    @user  = User.find params[:id]
    @users = @user.followers.paginate page: params[:page], per_page: 10
    render :show_follow
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end

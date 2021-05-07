class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
    if @user.save
      render json: @user.to_json
    else
      render json: { errord: 'попробуй ещё' }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: @user.to_json
    else
      render json: { errord: 'попробуй ещё' }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      render json: { errored: "sucsess"}
    else
      render json: { errored: "error" }
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :password)
  end
end

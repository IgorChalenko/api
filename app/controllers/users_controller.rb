class UsersController < ApplicationController
  def index
    @users = User.all
    render json: { 'success': true,
                   'message': 'Founded data',
                   'data': {
                     'users': @users

                   } }
  end

  def show
    @user = User.find(params[:id])
    render json: { 'success': true,
                   'message': 'User founded',
                   'data': {
                     'user': {
                       'id': @user.id,
                       'name': @user.name,
                       'email': @user.email,
                       'password': @user.password_digest,
                       'created_at': @user.created_at,
                       'updated_at': @user.updated_at
                     }
                   } }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { 'success': true,
                     'message': 'User created',
                     'data': {
                       'user': {
                         'id': @user.id,
                         'name': @user.name,
                         'email': @user.email,
                         'password': @user.password_digest,
                         'created_at': @user.created_at,
                         'updated_at': @user.updated_at
                       }
                     } }
    else
      render json: {  "success": false,
                      "message": 'Invalid email or password',
                      "data": {} }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: { 'success': true,
                     'message': 'User updated',
                     'data': {
                       'user': {
                         'id': @user.id,
                         'name': @user.name,
                         'email': @user.email,
                         'password': @user.password_digest,
                         'created_at': @user.created_at,
                         'updated_at': @user.updated_at
                       }
                     } }
    else
      render json: { 'success': false,
                     'message': 'Something goes wrong' }
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { 'success': true,
                   'message': 'User seccesfully deleted' }
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password_digest == params[:password]
      render json: { status: 'sucsess' }
    else
      render json: { errored: 'error' }
    end
  end

  private

  def user_params
    params.require(:users).permit(:name, :email, :password)
  end
end

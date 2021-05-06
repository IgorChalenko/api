
        class UsersController < ApplicationController
            def index
                @users = User.all
                render json: @users
            end
            def show
                @user = User.find(params[:id])
            end
            def create
                @user = User.new(user_params)
                if @user.save 
                    render json: @user.to_json    
                else 
                    render json: { errord: 'попробуй ещё'}
                end
            end
            def update
                @user = User.find(params[:id])
                @user.update(user_params)
                if @user.save
                    render json: @user.to_json
                else
                    render json: {errord: "попробуй ещё"}
                end    
            end

            def destroy
                @user = User.find(params[:id])
                @user.destroy
            end

            private
    
            def user_params
                params.require(:users).permit(:name, :email, :password)
            end
        end


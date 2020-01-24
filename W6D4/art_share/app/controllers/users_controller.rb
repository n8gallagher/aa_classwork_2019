class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        user.save!
        render json: User.all
        # if user.save
        #     render json: user
        # else
        #     render json: user.errors.full_messages, status: :unprocessable_entity
        # end
        
    end

    def show
        user = User.find(params[:id])
        if user
            render json: user
        else
            render json: user.errors.full_messages, status: 404
        end
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to user
        else
            render json: user.errors.full_messages, status: 418
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: User.all

    end

    private
    def user_params 
        params.require(:user).permit(:username)
    end
end

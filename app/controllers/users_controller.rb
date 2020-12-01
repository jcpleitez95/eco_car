class UsersController < ApplicationController

    before_action :get_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:my_errors] = @user.errors.full_messages
            redirect_to new_user_path(@user)
        end
    end

    def edit
    end

    def update
        @user.update(user_params)

        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:my_errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end
    
    def destroy
        @user.destroy
        #redirect_to login?
    end

    private

    def get_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
end

class FavoritesController < ApplicationController
    
    def show
        @favorite = Favorite.find(params[:id])
    end

    def index
       @favorites = Favorite.all.select {|f| f.user_id == @current_user.id}
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        redirect_to favorites_path(@current_user.favorites)
    end

    def add
        @model = Model.find(params[:id])
        Favorite.create(user_id: @current_user.id, model_id: @model.id)
        redirect_to model_path(@model)
    end

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :model_id)
    end

end

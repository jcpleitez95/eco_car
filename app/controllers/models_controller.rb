class ModelsController < ApplicationController
    before_action :get_model, only: [:show, :add_favorite]

    def index 
        @models = Model.all 
    end

    def show
    end

    # def add_favorite
    #     @current_user.favorites << Favorite.create(model_id: @model.id)
    # end

    private 

    def get_model
        @model = Model.find(params[:id])
    end

end

class ModelsController < ApplicationController
    before_action :get_model, only: [:show]
    skip_before_action :authorized, only: [:show]

    # def index 
    #     @models = Model.all 
    # end

    def show
    end

    private 

    def get_model
        @model = Model.find(params[:id])
    end

end

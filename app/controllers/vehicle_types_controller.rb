class VehicleTypesController < ApplicationController

    before_action :get_vtype, only: [:show]

    def index 
        @vehicle_types = VehicleType.all 
    end

    def show
    end

    private 

    def get_vtype
        @vehicle_type = VehicleType.find(params[:id])
    end

end

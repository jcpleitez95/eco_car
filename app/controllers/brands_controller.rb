class BrandsController < ApplicationController

    skip_before_action :authorized, only: [:index, :show]
    before_action :get_brand, only: [:show]

    def index 
        @brands = Brand.all 
    end

    def show
    end

    private 

    def get_brand
        @brand = Brand.find(params[:id])
    end

end

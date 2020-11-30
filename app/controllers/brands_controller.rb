class BrandsController < ApplicationController

    before_action :get_brand, only: [:show]

    def index 
        @brands = Brand.all 
    end

    def show
        get_brand
    end

    private 

    def get_brand
        @brand = Brand.find(params[:id])
    end

end

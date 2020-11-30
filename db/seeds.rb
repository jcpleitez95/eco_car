# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#require 'certified'

# Destroy DB
Brand.destroy_all 
VehicleType.destroy_all 
Model.destroy_all
User.destroy_all
Favorite.destroy_all

# API setup 
require 'net/http'
require 'json'
url = "https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformakeyear/make/tesla/modelyear/2020/vehicleType/passenger?format=json"
uri = URI(url)
response = Net::HTTP.get(uri)
# puts response

# Car DB Setup
car_brands = ["Tesla", "Honda", "Toyota", "Ford", 
            "Chevrolet", "Dodge", "Mazda", "Porsche", 
            "Ferrari", "Lamborghini", "McClaren", "Smart", 
            "Nissan", "BMW", "Fiat", "Bugatti"].sort

car_brands.each do |brand|
    Brand.create(name: brand)
end

# Vehicle Type DB Setup
vehicle_types = ["Passenger_Car", "Multipurpose_Passenger_Vehicle", "Truck"]

vehicle_types.each do |vtype|
    VehicleType.create(name: vtype)
end

# Model DB Setup
Brand.all.each do |brand|
    VehicleType.all.each do |vtype|
        url = "https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformakeyear/make/#{brand.name.downcase}/modelyear/2020/vehicleType/#{vtype.name.downcase}?format=json"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response_hash = JSON.parse(response)
        response_hash["Results"].each do |model|
            Model.create(brand_id: brand.id,
                        vehicle_type_id: vtype.id,
                        name: model["Model_Name"],
                        price: rand(100...10000),
                        eco_score: rand(1..10))
        end
    end
end

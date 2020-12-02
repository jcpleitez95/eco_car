
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
            "Ferrari", "Lamborghini", "Subaru", "Jeep", 
            "Nissan", "BMW", "Fiat", "Bugatti"].sort

car_brands.each do |brand|
    Brand.create(name: brand)
end

# Vehicle Type DB Setup
vehicle_types = ["Passenger Car", "Multipurpose Passenger Vehicle", "Truck"]

vehicle_types.each do |vtype|
    VehicleType.create(name: vtype)
end

# Hash from Retool
model_array = [{"Brand":"BMW","Model":"328i","Price":"40750","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M3","Price":"70895","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"335i","Price":"69850","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"528i","Price":"48500","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"535i","Price":"54200","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"550i","Price":"54200","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"740i","Price":"86800","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"750i","Price":"86800","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"Z4","Price":"49700","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M6","Price":"119900","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"640i","Price":"70300","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"650i","Price":"70300","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M5","Price":"103500","MPG":"21","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"228i","Price":"35900","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M235i","Price":"45500","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"320i","Price":"41250","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"328d","Price":"45278","MPG":"43","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"i3","Price":"44450","MPG":"102","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"i8","Price":"147500","MPG":"29","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"428i","Price":"44750","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"435i","Price":"44750","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"535d","Price":"57350","MPG":"38","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"ActiveHybrid 5","Price":"62,100","MPG":"30","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"530i","Price":"54200","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"330i","Price":"41250","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"540i","Price":"59450","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M2","Price":"58900","MPG":"24","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"340i","Price":"54995","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"330e","Price":"44550","MPG":"30","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M4","Price":"69150","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"230i","Price":"35900","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M240i","Price":"46350","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"430i","Price":"45600","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"440i","Price":"51350","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"B7","Price":"142695","MPG":"21","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"740e","Price":"59800","MPG":"27","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"540d","Price":"62000","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"530e","Price":"57200","MPG":"27","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M550i","Price":"76650","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M760i","Price":"157700","MPG":"20","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"750i / B7","Price":"96950","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"650i / B6","Price":"70300","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M340i","Price":"54995","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"745e","Price":"95550","MPG":"26","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"840i","Price":"85000","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M850i","Price":"111900","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"M8","Price":"130000","MPG":"21","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"BMW","Model":"X6","Price":"65050","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"BMW","Model":"X5","Price":"59400","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"BMW","Model":"X3","Price":"43000","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"BMW","Model":"X1","Price":"35400","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"BMW","Model":"X4","Price":"51600","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"BMW","Model":"X2","Price":"36600","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"BMW","Model":"X7","Price":"74900","MPG":"24","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Bugatti","Model":"Chiron","Price":"3000000","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Camaro","Price":"25000","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Corvette","Price":"58900","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Cruze","Price":"17000","MPG":"39","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Impala","Price":"31620","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Malibu","Price":"22140","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Sonic","Price":"16720","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Spark","Price":"13400","MPG":"38","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Trax","Price":"21300","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Bolt EV","Price":"36620","MPG":"127","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},
{"Brand":"Chevrolet","Model":"Equinox","Price":"23800","MPG":"39","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Express","Price":"32500","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Suburban","Price":"51700","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Tahoe","Price":"49000","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Traverse","Price":"29800","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Blazer","Price":"28800","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Silverado HD","Price":"34600","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Silverado LD","Price":"28300","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Chevrolet","Model":"Colorado","Price":"21300","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Truck"},
{"Brand":"Dodge","Model":"Avenger","Price":"15000","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"Dodge","Model":"Challenger","Price":"28095","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"Dodge","Model":"Charger","Price":"29995","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"Dodge","Model":"Journey","Price":"23675","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Dodge","Model":"Durango","Price":"30795","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Dodge","Model":"Grand Caravan","Price":"27530","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Dodge","Model":"Ram","Price":"42890","MPG":"21","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Dodge","Model":"Dakota","Price":"22000","MPG":"20","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Ferrari","Model":"California T","Price":"409888","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"488 GTB","Price":"330000","MPG":"20","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"GTC4Lusso","Price":"260000","MPG":"21","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"488 Spider","Price":"330000","MPG":"19","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"812 Superfast","Price":"335000","MPG":"16","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"Portofino","Price":"215000","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"488 Pista","Price":"333000","MPG":"20","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Ferrari","Model":"F8 Tributo","Price":"276500","MPG":"19","Electric":"0","Hybrid":"","EcoScore":"1","Vehicle Type":"Passenger Car"},
{"Brand":"Fiat","Model":"124 Spider","Price":"26840","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Fiat","Model":"500L","Price":"22500","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"Fiat","Model":"500X","Price":"24590","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Fiat","Model":"Ducato","Price":"46300","MPG":"46","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"Fusion","Price":"23170","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Ford","Model":"Mustang","Price":"26670","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},
{"Brand":"Ford","Model":"GT","Price":"35880","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},
{"Brand":"Ford","Model":"Edge","Price":"31100","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"Escape","Price":"24885","MPG":"37","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"Expedition","Price":"52810","MPG":"23","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"Explorer","Price":"32765","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"Explorer Sport Trac","Price":"54740","MPG":"24","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"Expedition MAX","Price":"55835","MPG":"23","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"Transit","Price":"40180","MPG":"19","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"Ecosport","Price":"19995","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},
{"Brand":"Ford","Model":"F-150","Price":"28745","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"Ranger","Price":"24110","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"F-250","Price":"34035","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"F-350","Price":"35550","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"F-450","Price":"50210","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"F-550","Price":"46830","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"Transit Connect","Price":"24275","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Truck"},
{"Brand":"Ford","Model":"F-600","Price":"49285","MPG":"14","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"},
{"Brand":"Honda","Model":"Accord","Price":"24270","MPG":"38","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Honda","Model":"Civic","Price":"20000","MPG":"42","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Honda","Model":"Insight","Price":"22930","MPG":"49","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Honda","Model":"Fit","Price":"16190","MPG":"40","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},
{"Brand":"Honda","Model":"CLARITY","Price":"33400","MPG":"40","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},
{"Brand":"Honda","Model":"CLARITY ELECTRIC","Price":"58490","MPG":"67","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Honda","Model":"Pilot","Price":"31650","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Honda","Model":"CR-V","Price":"25150","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Honda","Model":"Odyssey","Price":"30790","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Honda","Model":"Passport","Price":"31990","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Honda","Model":"HR-V","Price":"20920","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Honda","Model":"Ridgeline","Price":"33900","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Jeep","Model":"Wrangler","Price":"28295","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Jeep","Model":"Cherokee","Price":"25840","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Jeep","Model":"Compass","Price":"22280","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Jeep","Model":"Grand Cherokee","Price":"32150","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Jeep","Model":"Renegade","Price":"22375","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Jeep","Model":"Gladiator","Price":"33545","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Lamborghini","Model":"Aventador","Price":"417826","MPG":"15","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},{"Brand":"Lamborghini","Model":"Huracan","Price":"208571","MPG":"18","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Passenger Car"},{"Brand":"Lamborghini","Model":"URUS","Price":"207326","MPG":"17","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Mazda","Model":"MX-5","Price":"26580","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Mazda","Model":"Mazda3","Price":"21500","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Mazda","Model":"Mazda6","Price":"24100","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Mazda","Model":"CX-3","Price":"20640","MPG":"34","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Mazda","Model":"CX-9","Price":"33890","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Mazda","Model":"CX-5","Price":"25190","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Mazda","Model":"CX-30","Price":"21900","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Nissan","Model":"GT-R","Price":"113540","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Versa","Price":"14830","MPG":"40","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Altima","Price":"24300","MPG":"39","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Leaf","Price":"31600","MPG":"99","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"370Z","Price":"30090","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Sentra","Price":"19310","MPG":"39","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Maxima","Price":"34450","MPG":"30","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Rogue Sport","Price":"23430","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Nissan","Model":"Kicks","Price":"19070","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Nissan","Model":"Pathfinder","Price":"31980","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Nissan","Model":"Rogue","Price":"25490","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Nissan","Model":"Murano","Price":"31730","MPG":"28","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Nissan","Model":"Armada","Price":"47500","MPG":"19","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Nissan","Model":"NV200","Price":"23080","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Nissan","Model":"Frontier","Price":"26790","MPG":"24","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Nissan","Model":"Titan","Price":"3690","MPG":"22","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Nissan","Model":"NV","Price":"36360","MPG":"25","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Porsche","Model":"911","Price":"97400","MPG":"24","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},{"Brand":"Porsche","Model":"Panamera","Price":"87200","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},{"Brand":"Porsche","Model":"718 Cayman","Price":"57500","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},{"Brand":"Porsche","Model":"718 Boxster","Price":"59600","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},{"Brand":"Porsche","Model":"718 Spyder","Price":"96300","MPG":"23","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Passenger Car"},{"Brand":"Porsche","Model":"Taycan","Price":"103800","MPG":"71","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Porsche","Model":"Cayenne","Price":"6600","MPG":"23","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Porsche","Model":"Macan","Price":"50900","MPG":"23","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Subaru","Model":"Legacy","Price":"22745","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Subaru","Model":"Impreza","Price":"18695","MPG":"36","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Subaru","Model":"WRX","Price":"27495","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Passenger Car"},{"Brand":"Subaru","Model":"BRZ","Price":"28845","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},{"Brand":"Subaru","Model":"Outback","Price":"26645","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Subaru","Model":"Forester","Price":"24495","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Subaru","Model":"Crosstrek","Price":"22145","MPG":"33","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Subaru","Model":"Ascent","Price":"31995","MPG":"27","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Tesla","Model":"Model S","Price":"69420","MPG":"112","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Tesla","Model":"Model X","Price":"79990","MPG":"101","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Tesla","Model":"Model 3","Price":"35000","MPG":"132","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Tesla","Model":"Model Y","Price":"49990","MPG":"114","Electric":"1","Hybrid":"0","EcoScore":"10","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Corolla","Price":"19600","MPG":"40","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"PRIUS","Price":"24325","MPG":"53","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Yaris","Price":"17750","MPG":"40","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Avalon","Price":"35875","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Camry","Price":"24425","MPG":"41","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Supra","Price":"49990","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Mirai","Price":"58550","MPG":"66","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"86","Price":"27060","MPG":"32","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"C-HR","Price":"21295","MPG":"31","Electric":"0","Hybrid":"0","EcoScore":"4","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"Prius Prime","Price":"27900","MPG":"54","Electric":"0","Hybrid":"1","EcoScore":"7","Vehicle Type":"Passenger Car"},{"Brand":"Toyota","Model":"LAND CRUISER","Price":"85415","MPG":"17","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"Highlander","Price":"34600","MPG":"29","Electric":"0","Hybrid":"0","EcoScore":"3","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"4-Runner","Price":"36120","MPG":"19","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"RAV4","Price":"25950","MPG":"35","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"Sienna","Price":"31640","MPG":"26","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"Sequoia","Price":"49980","MPG":"17","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"Venza","Price":"32470","MPG":"40","Electric":"0","Hybrid":"0","EcoScore":"5","Vehicle Type":"Multipurpose Passenger Vehicle"},{"Brand":"Toyota","Model":"Tacoma","Price":"26050","MPG":"23","Electric":"0","Hybrid":"0","EcoScore":"2","Vehicle Type":"Truck"},{"Brand":"Toyota","Model":"Tundra","Price":"33575","MPG":"18","Electric":"0","Hybrid":"0","EcoScore":"1","Vehicle Type":"Truck"}]

# Model DB Setup Take II
model_array.each do |model|
    Model.create(brand_id: Brand.find_by(name: model[:Brand]).id, 
    vehicle_type_id: VehicleType.find_by(name: model[:"Vehicle Type"]).id, 
    name: model[:Model], price: model[:Price], eco_score: model[:EcoScore])
end


# Model DB Setup
# Brand.all.each do |brand|
#     VehicleType.all.each do |vtype|
#         url = "https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformakeyear/make/#{brand.name.downcase}/modelyear/2020/vehicleType/#{vtype.name.downcase}?format=json"
#         uri = URI(url)
#         response = Net::HTTP.get(uri)
#         response_hash = JSON.parse(response)
#         response_hash["Results"].each do |model|
#             # if model["Model_Name"] in {remove_hash}
#             # else 
#             Model.create(brand_id: brand.id,
#                         vehicle_type_id: vtype.id,
#                         name: model["Model_Name"],
#                         price: rand(100...10000),
#                         eco_score: rand(1..10))
#         end
#     end
# end

# User.create(username: "JC", password_digest: "123")
# User.create(username: "BO")



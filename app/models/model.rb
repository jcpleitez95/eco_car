class Model < ApplicationRecord
    has_many :favorites
    has_many :users, through: :favorites
    belongs_to :brand
    belongs_to :vehicle_type

    def find_comps
        comps_array = Model.all.find_all do |model| 
            if model.vehicle_type == self.vehicle_type
                if model.price < (self.price * 1.5) && model.price > (self.price * 0.5)
                    if model.eco_score > self.eco_score
                        model     
                    end
                end
            end
        end

        # comps_array = Model.all.find_all { }
        if comps_array.size == 1
            item = comps_array[0]
            comps_array = []
            comps_array.push(item)
        elsif comps_array.size == 2
            comps_array[0,1]
        elsif comps_array.size > 2 
            comps_array = comps_array.group_by{|model| model.eco_score}.max.last
            if comps_array.size == 1
                item = comps_array[0]
                comps_array = []
                comps_array.push(item)
            elsif comps_array.size == 2
                comps_array[0,1]
            else 
                comps_array.sample(3)
            end
        end
    end
end

class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.integer :brand_id
      t.integer :vehicle_type_id
      t.string :name
      t.integer :price
      t.integer :eco_score

      t.timestamps
    end
  end
end

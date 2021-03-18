class CreateShippingAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_areas do |t|
      t.integer :shipping_area_id,      null: false

      t.timestamps
    end
  end
end

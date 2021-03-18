class CreateShippingCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_charges do |t|
      t.integer :shipping_charge_id,  null: false
      t.timestamps
    end
  end
end

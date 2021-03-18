class CreateShippingDates < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_dates do |t|
      t.integer :shipping_date_id,      null: false

      t.timestamps
    end
  end
end

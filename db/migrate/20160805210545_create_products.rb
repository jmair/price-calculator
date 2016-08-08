class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :unit_price, default: 0, precision: 8, scale: 2, null: false
      t.integer :sale_quantity, default: 0, precision: 8, scale: 2, null: false
      t.decimal :sale_price, default: 0, precision: 8, scale: 2, null: false
      t.boolean :on_sale, default: false, null: false

      t.timestamps
    end
  end
end

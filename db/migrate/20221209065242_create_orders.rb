class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string    :post_code,   null: false
      t.integer    :prefecture,    null: false
      t.string     :city
      t.string     :house_number
      t.string     :building_name
      t.references :item,      null: false, foreign_key: true
      t.timestamps
    end
  end
end

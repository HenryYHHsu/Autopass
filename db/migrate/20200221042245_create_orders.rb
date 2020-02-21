class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :bill
      t.integer :item
      t.integer :qty
      t.integer :storename

      t.timestamps
    end
  end
end

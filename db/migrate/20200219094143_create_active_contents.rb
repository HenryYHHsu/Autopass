class CreateActiveContents < ActiveRecord::Migration[6.0]
  def change
    create_table :active_contents do |t|
      t.integer :type
      t.integer :discount_way
      t.integer :target
      t.integer :store_id
      t.integer :product_id
      t.belongs_to :active, null: false, foreign_key: true

      t.timestamps
    end
  end
end

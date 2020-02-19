class CreateActiveConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :active_conditions do |t|
      t.integer :type
      t.boolean :limit     , :default => false 
      t.integer :limitcash , :default => 0
      t.time :start
      t.time :end
      t.belongs_to :active, null: false, foreign_key: true

      t.timestamps
    end
  end
end

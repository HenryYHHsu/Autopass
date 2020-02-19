class CreateActives < ActiveRecord::Migration[6.0]
  def change
    create_table :actives do |t|
      t.string :name
      t.boolean :a_status , :default => false
      t.boolean :a_type   , :default => false
      t.integer :a_target , :default => 0
      t.integer :a_limit  , :default => 0
      t.boolean :b_status , :default => false
      t.boolean :b_type   , :default => false
      t.integer :b_target , :default => 0
      t.integer :b_limit  , :default => 0
      t.boolean :c_status , :default => false
      t.time :c_start
      t.time :c_end
      t.boolean :d_status , :default => false
      t.string :d_target 
      t.boolean :e_status , :default => false 
      t.integer :e_target 

      t.timestamps
    end
  end
end

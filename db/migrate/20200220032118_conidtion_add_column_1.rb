class ConidtionAddColumn1 < ActiveRecord::Migration[6.0]
  def change
    remove_column :active_conditions, :type, :integer
    add_column :active_conditions, :condition_type, :integer , :default => 0
    
  end
end

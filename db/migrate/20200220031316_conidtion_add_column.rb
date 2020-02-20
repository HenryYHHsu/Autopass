class ConidtionAddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :active_conditions, :target, :integer , :default => 0
  end
end

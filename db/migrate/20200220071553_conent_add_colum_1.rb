class ConentAddColum1 < ActiveRecord::Migration[6.0]
  def change
    change_column :active_contents, :discount_way, :integer , :default => 0
  end
end

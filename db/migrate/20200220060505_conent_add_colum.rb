class ConentAddColum < ActiveRecord::Migration[6.0]
  def change
    remove_column :active_contents, :type, :integer
    add_column :active_contents, :content_type, :integer , :default => 0
  end
end

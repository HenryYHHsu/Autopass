class ConidtionRemoveColumn2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :active_conditions, :start, :time
    remove_column :active_conditions, :end, :time
  end
end

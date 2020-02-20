class ConidtionAddColumn2 < ActiveRecord::Migration[6.0]
  def change
    add_column :active_conditions, :start_datetime, :datetime
    add_column :active_conditions, :end_datetime, :datetime
  end
end

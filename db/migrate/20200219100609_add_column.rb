class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :active_contents, :discountvalue, :integer 
  end
end

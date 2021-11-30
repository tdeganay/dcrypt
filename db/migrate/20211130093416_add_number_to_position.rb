class AddNumberToPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :positions, :number, :integer
  end
end

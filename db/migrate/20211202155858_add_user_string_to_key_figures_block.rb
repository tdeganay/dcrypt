class AddUserStringToKeyFiguresBlock < ActiveRecord::Migration[6.0]
  def change
    add_column :key_figures_blocks, :user_string, :string
  end
end

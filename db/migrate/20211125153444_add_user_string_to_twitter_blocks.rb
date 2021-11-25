class AddUserStringToTwitterBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :twitter_blocks, :user_string, :string
  end
end

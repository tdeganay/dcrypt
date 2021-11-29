class AddUserStringToNewsBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :news_blocks, :user_string, :string
  end
end

class CreateMessariBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :messari_blocks do |t|
      t.string :user_string

      t.timestamps
    end
  end
end
